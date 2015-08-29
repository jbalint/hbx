{-# LANGUAGE OverloadedStrings, GADTs, StandaloneDeriving #-}
-- http://hackage.haskell.org/package/protocol-buffers
-- https://code.google.com/p/protobuf-haskell/wiki/Basics

module Database.Hbx () where

--import Control.Concurrent
--import Data.String
import Network.Socket
import qualified Data.ByteString.Lazy as B
import Data.ByteString.Lazy.Char8 (unpack, pack)
import Data.ByteString.Internal (toForeignPtr)
import System.IO
import Data.Binary.Get
import Data.Binary.Put
import Data.Word
import Control.Applicative
import Control.Monad
import Data.Char (ord)

import Data.Bits (xor)

import Data.ByteString.Builder

import Crypto.Hash.SHA1

import Text.ProtocolBuffers.Header hiding (append)
import Text.ProtocolBuffers.WireMessage hiding (Get, runGet)

import qualified Database.Hbx.Proto.ClientMessages.Type as ClientMessages
import qualified Database.Hbx.Proto.ServerMessages.Type as ServerMessages
--import Database.Hbx.Proto.Session.AuthenticateContinue
import Database.Hbx.Proto.Session.AuthenticateContinue (AuthenticateContinue)
import qualified Database.Hbx.Proto.Session.AuthenticateContinue as AuthCont (auth_data)
import Database.Hbx.Proto.Session.AuthenticateOk hiding (auth_data)
import Database.Hbx.Proto.Session.AuthenticateStart (AuthenticateStart)
import qualified Database.Hbx.Proto.Session.AuthenticateStart as AuthStart (auth_data, mech_name)
import Database.Hbx.Proto.Sql.StmtExecute

--forkIO

data Header t = Enum t => Header
                { msgSize :: Int,
                  typeTag :: t
                }

-- this is a "standalone deriving"
deriving instance Show t => Show (Header t)

-- int value from Type enum
noticeTypeTag = fromEnum ServerMessages.NOTICE

plainAuthMessage :: AuthenticateStart
plainAuthMessage = defaultValue {AuthStart.mech_name = Utf8 "PLAIN", AuthStart.auth_data = Just "test\0root\0password1234"}

--IsString (OverloadedStrings)

hashPw :: ByteString -> ByteString -> ByteString
hashPw seed pw = B.pack $ B.zipWith xor toBeXored stage1
  where
    hash = B.fromStrict . hashlazy
    stage1 = hash pw
    stage2 = hash stage1
    toBeXored = hash $ B.append seed stage2

sendMessage :: (Wire m, ReflectDescriptor m) => ClientMessages.Type -> m -> Handle -> IO ()
sendMessage typeTag msg hnd = do
  B.hPut hnd $ runPut (putWord32le . fromIntegral . (1+) $ messageSize msg)
  B.hPut hnd $ B.cons (fromIntegral $ fromEnum typeTag) ""
  B.hPut hnd $ messagePut msg
  hFlush hnd

decodeHeader :: Enum t => Get (Header t)
decodeHeader = Header <$> getMsgSize <*> getTypeTag
  where
    getMsgSize = fmap ((flip (-) 1) . fromIntegral) getWord32le
    getTypeTag = fmap (toEnum . fromIntegral) getWord8

readHeader :: Handle -> IO (Header ServerMessages.Type)
readHeader hnd = B.hGet hnd 5 >>= return . runGet decodeHeader

parseMsg :: (Wire m, ReflectDescriptor m) => ByteString -> IO m
parseMsg = return . (either error fst) . messageGet

readMessage :: (Wire m, ReflectDescriptor m) => Handle -> IO m
--readMessage = (readHeader `blog` (\hnd -> hGet hnd . msgSize)) >=> parseMsg
--readMessage = (readHeader `blog` (((.) . (flip (.))) msgSize hGet)) >=> parseMsg
-- being overly clever here: http://stackoverflow.com/questions/5821089/haskell-function-composition-operator-of-type-c%E2%86%92d-%E2%86%92-a%E2%86%92b%E2%86%92c-%E2%86%92-a%E2%86%92b%E2%86%92d
-- (liftA2 (>>=)) :: (Monad m, Applicative f) => f (m a) -> f (a -> m b) -> f (m b)
-- ((.) . (flip (.))) msgSize :: (a -> Int -> c) -> a -> Header t -> c
-- ((.) . (flip (.))) msgSize hGet :: Handle -> Header t -> IO ByteString
readMessage = ((liftA2 (>>=)) readHeader (((.) . (flip (.))) msgSize B.hGet)) >=> parseMsg
  where
    blog :: Monad m => (a -> m b) -> (a -> b -> m c) -> a -> m c
    blog f g x = do { y <- f x; g x y }

-- for dev convenience
--hnd :: Handle
--hnd = undefined

-- ripped from Data.ByteString.Internal
c2w :: Char -> Word8
c2w = fromIntegral . ord

mysql41Auth :: ByteString -> ByteString -> ByteString -> Handle -> IO AuthenticateOk
mysql41Auth db user pass hnd = do
  let authStartMsg = defaultValue {AuthStart.mech_name = Utf8 "MYSQL41"}
  sendMessage ClientMessages.SESS_AUTHENTICATE_START authStartMsg hnd
  seedMsg <- readMessage hnd
  let pw = hashPw (AuthCont.auth_data seedMsg) pass
  let pwHex = B.cons (c2w '*') $ toLazyByteString $ byteStringHex (B.toStrict pw)
  let authData = B.intercalate "\0" [db, user, pwHex]
  let authContMsg = defaultValue {AuthCont.auth_data  = authData}
  sendMessage ClientMessages.SESS_AUTHENTICATE_CONTINUE authContMsg hnd
  readMessage hnd

x4 :: IO ()
x4 = do
  sock <- socket AF_INET Stream 0
  host <- inet_addr "127.0.0.1"
  connect sock (SockAddrInet 33060 host)
  hnd <- socketToHandle sock ReadWriteMode
  hSetBuffering hnd . BlockBuffering $ Just (128 * 1024)
  authOk <- mysql41Auth "test" "root" "password1234" hnd
  print authOk

x3 :: IO ()
x3 = do
  sock <- socket AF_INET Stream 0
  host <- inet_addr "127.0.0.1"
  connect sock (SockAddrInet 33060 host)
  hnd <- socketToHandle sock ReadWriteMode
  hSetBuffering hnd . BlockBuffering $ Just (128 * 1024)
  sendMessage ClientMessages.SESS_AUTHENTICATE_START plainAuthMessage hnd
  authOk <- (readMessage hnd :: IO AuthenticateOk)
  print authOk

plainAuthMessagePacket :: String
plainAuthMessagePacket = unpack . messagePut $ plainAuthMessage

x2 :: IO ()
x2 = do
  sock <- socket AF_INET Stream 0
  host <- inet_addr "127.0.0.1"
  connect sock (SockAddrInet 33060 host)
  -- http://book.realworldhaskell.org/read/characters-strings-and-escaping-rules.html
  bytes1 <- send sock "\x20\0\0\0\4"
  print bytes1
  bytes2 <- send sock plainAuthMessagePacket
  print bytes2
  return ()
