{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Resultset.FetchDoneMoreResultsets (FetchDoneMoreResultsets(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
data FetchDoneMoreResultsets = FetchDoneMoreResultsets{}
                             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable FetchDoneMoreResultsets where
  mergeAppend FetchDoneMoreResultsets FetchDoneMoreResultsets = FetchDoneMoreResultsets
 
instance P'.Default FetchDoneMoreResultsets where
  defaultValue = FetchDoneMoreResultsets
 
instance P'.Wire FetchDoneMoreResultsets where
  wireSize ft' self'@(FetchDoneMoreResultsets)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = 0
  wirePut ft' self'@(FetchDoneMoreResultsets)
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
 
instance P'.MessageAPI msg' (msg' -> FetchDoneMoreResultsets) FetchDoneMoreResultsets where
  getVal m' f' = f' m'
 
instance P'.GPB FetchDoneMoreResultsets
 
instance P'.ReflectDescriptor FetchDoneMoreResultsets where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Resultset.FetchDoneMoreResultsets\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Resultset\"], baseName = MName \"FetchDoneMoreResultsets\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Resultset\",\"FetchDoneMoreResultsets.hs\"], isGroup = False, fields = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType FetchDoneMoreResultsets where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg FetchDoneMoreResultsets where
  textPut msg = Prelude'.return ()
  textGet = Prelude'.return P'.defaultValue