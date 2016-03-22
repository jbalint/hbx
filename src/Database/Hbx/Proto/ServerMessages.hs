{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.ServerMessages (ServerMessages(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
data ServerMessages = ServerMessages{}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable ServerMessages where
  mergeAppend ServerMessages ServerMessages = ServerMessages
 
instance P'.Default ServerMessages where
  defaultValue = ServerMessages
 
instance P'.Wire ServerMessages where
  wireSize ft' self'@(ServerMessages)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = 0
  wirePut ft' self'@(ServerMessages)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             Prelude'.return ()
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> ServerMessages) ServerMessages where
  getVal m' f' = f' m'
 
instance P'.GPB ServerMessages
 
instance P'.ReflectDescriptor ServerMessages where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.ServerMessages\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\"], baseName = MName \"ServerMessages\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"ServerMessages.hs\"], isGroup = False, fields = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType ServerMessages where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg ServerMessages where
  textPut msg = Prelude'.return ()
  textGet = Prelude'.return P'.defaultValue