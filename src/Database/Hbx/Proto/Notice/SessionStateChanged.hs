{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Notice.SessionStateChanged (SessionStateChanged(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Database.Hbx.Proto.Datatypes.Scalar as Database.Hbx.Proto.Datatypes (Scalar)
import qualified Database.Hbx.Proto.Notice.SessionStateChanged.Parameter as Database.Hbx.Proto.Notice.SessionStateChanged
       (Parameter)
 
data SessionStateChanged = SessionStateChanged{param :: !(Database.Hbx.Proto.Notice.SessionStateChanged.Parameter),
                                               value :: !(P'.Maybe Database.Hbx.Proto.Datatypes.Scalar)}
                         deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable SessionStateChanged where
  mergeAppend (SessionStateChanged x'1 x'2) (SessionStateChanged y'1 y'2)
   = SessionStateChanged (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default SessionStateChanged where
  defaultValue = SessionStateChanged P'.defaultValue P'.defaultValue
 
instance P'.Wire SessionStateChanged where
  wireSize ft' self'@(SessionStateChanged x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeOpt 1 11 x'2)
  wirePut ft' self'@(SessionStateChanged x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 8 14 x'1
             P'.wirePutOpt 18 11 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{param = new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{value = P'.mergeAppend (value old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> SessionStateChanged) SessionStateChanged where
  getVal m' f' = f' m'
 
instance P'.GPB SessionStateChanged
 
instance P'.ReflectDescriptor SessionStateChanged where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Notice.SessionStateChanged\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Notice\"], baseName = MName \"SessionStateChanged\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Notice\",\"SessionStateChanged.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Notice.SessionStateChanged.param\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Notice\",MName \"SessionStateChanged\"], baseName' = FName \"param\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Notice.SessionStateChanged.Parameter\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Notice\",MName \"SessionStateChanged\"], baseName = MName \"Parameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Notice.SessionStateChanged.value\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Notice\",MName \"SessionStateChanged\"], baseName' = FName \"value\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Scalar\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\"], baseName = MName \"Scalar\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType SessionStateChanged where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg SessionStateChanged where
  textPut msg
   = do
       P'.tellT "param" (param msg)
       P'.tellT "value" (value msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'param, parse'value]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'param
         = P'.try
            (do
               v <- P'.getT "param"
               Prelude'.return (\ o -> o{param = v}))
        parse'value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{value = v}))