{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Notice.Warning (Warning(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Database.Hbx.Proto.Notice.Warning.Level as Database.Hbx.Proto.Notice.Warning (Level)
 
data Warning = Warning{level :: !(P'.Maybe Database.Hbx.Proto.Notice.Warning.Level), code :: !(P'.Word32), msg :: !(P'.Utf8)}
             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable Warning where
  mergeAppend (Warning x'1 x'2 x'3) (Warning y'1 y'2 y'3)
   = Warning (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)
 
instance P'.Default Warning where
  defaultValue = Warning (Prelude'.Just (Prelude'.read "WARNING")) P'.defaultValue P'.defaultValue
 
instance P'.Wire Warning where
  wireSize ft' self'@(Warning x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeReq 1 13 x'2 + P'.wireSizeReq 1 9 x'3)
  wirePut ft' self'@(Warning x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 14 x'1
             P'.wirePutReq 16 13 x'2
             P'.wirePutReq 26 9 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{level = Prelude'.Just new'Field}) (P'.wireGet 14)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{code = new'Field}) (P'.wireGet 13)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{msg = new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> Warning) Warning where
  getVal m' f' = f' m'
 
instance P'.GPB Warning
 
instance P'.ReflectDescriptor Warning where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [16, 26]) (P'.fromDistinctAscList [8, 16, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Notice.Warning\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Notice\"], baseName = MName \"Warning\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Notice\",\"Warning.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Notice.Warning.level\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Notice\",MName \"Warning\"], baseName' = FName \"level\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Notice.Warning.Level\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Notice\",MName \"Warning\"], baseName = MName \"Level\"}), hsRawDefault = Just \"WARNING\", hsDefault = Just (HsDef'Enum \"WARNING\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Notice.Warning.code\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Notice\",MName \"Warning\"], baseName' = FName \"code\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Notice.Warning.msg\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Notice\",MName \"Warning\"], baseName' = FName \"msg\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType Warning where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg Warning where
  textPut msg'
   = do
       P'.tellT "level" (level msg')
       P'.tellT "code" (code msg')
       P'.tellT "msg" (msg msg')
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'level, parse'code, parse'msg]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'level
         = P'.try
            (do
               v <- P'.getT "level"
               Prelude'.return (\ o -> o{level = v}))
        parse'code
         = P'.try
            (do
               v <- P'.getT "code"
               Prelude'.return (\ o -> o{code = v}))
        parse'msg
         = P'.try
            (do
               v <- P'.getT "msg"
               Prelude'.return (\ o -> o{msg = v}))