{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Datatypes.Any (Any(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Database.Hbx.Proto.Datatypes.Any.Type as Database.Hbx.Proto.Datatypes.Any (Type)
import qualified Database.Hbx.Proto.Datatypes.Array as Database.Hbx.Proto.Datatypes (Array)
import qualified Database.Hbx.Proto.Datatypes.Object as Database.Hbx.Proto.Datatypes (Object)
import qualified Database.Hbx.Proto.Datatypes.Scalar as Database.Hbx.Proto.Datatypes (Scalar)
 
data Any = Any{type' :: !(Database.Hbx.Proto.Datatypes.Any.Type), scalar :: !(P'.Maybe Database.Hbx.Proto.Datatypes.Scalar),
               obj :: !(P'.Maybe Database.Hbx.Proto.Datatypes.Object), array :: !(P'.Maybe Database.Hbx.Proto.Datatypes.Array)}
         deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable Any where
  mergeAppend (Any x'1 x'2 x'3 x'4) (Any y'1 y'2 y'3 y'4)
   = Any (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
 
instance P'.Default Any where
  defaultValue = Any P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
 
instance P'.Wire Any where
  wireSize ft' self'@(Any x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4)
  wirePut ft' self'@(Any x'1 x'2 x'3 x'4)
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
             P'.wirePutOpt 26 11 x'3
             P'.wirePutOpt 34 11 x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{scalar = P'.mergeAppend (scalar old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{obj = P'.mergeAppend (obj old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{array = P'.mergeAppend (array old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> Any) Any where
  getVal m' f' = f' m'
 
instance P'.GPB Any
 
instance P'.ReflectDescriptor Any where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Any\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\"], baseName = MName \"Any\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Datatypes\",\"Any.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Any.type\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Any\"], baseName' = FName \"type'\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Any.Type\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Any\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Any.scalar\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Any\"], baseName' = FName \"scalar\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Scalar\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\"], baseName = MName \"Scalar\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Any.obj\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Any\"], baseName' = FName \"obj\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Object\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\"], baseName = MName \"Object\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Any.array\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Any\"], baseName' = FName \"array\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Array\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\"], baseName = MName \"Array\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType Any where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg Any where
  textPut msg
   = do
       P'.tellT "type" (type' msg)
       P'.tellT "scalar" (scalar msg)
       P'.tellT "obj" (obj msg)
       P'.tellT "array" (array msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'type', parse'scalar, parse'obj, parse'array]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{type' = v}))
        parse'scalar
         = P'.try
            (do
               v <- P'.getT "scalar"
               Prelude'.return (\ o -> o{scalar = v}))
        parse'obj
         = P'.try
            (do
               v <- P'.getT "obj"
               Prelude'.return (\ o -> o{obj = v}))
        parse'array
         = P'.try
            (do
               v <- P'.getT "array"
               Prelude'.return (\ o -> o{array = v}))