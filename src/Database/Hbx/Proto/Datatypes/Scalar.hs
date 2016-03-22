{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Datatypes.Scalar (Scalar(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Database.Hbx.Proto.Datatypes.Scalar.String as Database.Hbx.Proto.Datatypes.Scalar (String)
import qualified Database.Hbx.Proto.Datatypes.Scalar.Type as Database.Hbx.Proto.Datatypes.Scalar (Type)
 
data Scalar = Scalar{type' :: !(Database.Hbx.Proto.Datatypes.Scalar.Type), v_signed_int :: !(P'.Maybe P'.Int64),
                     v_unsigned_int :: !(P'.Maybe P'.Word64), v_opaque :: !(P'.Maybe P'.ByteString),
                     v_double :: !(P'.Maybe P'.Double), v_float :: !(P'.Maybe P'.Float), v_bool :: !(P'.Maybe P'.Bool),
                     v_string :: !(P'.Maybe Database.Hbx.Proto.Datatypes.Scalar.String)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable Scalar where
  mergeAppend (Scalar x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8) (Scalar y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8)
   = Scalar (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
 
instance P'.Default Scalar where
  defaultValue
   = Scalar P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
 
instance P'.Wire Scalar where
  wireSize ft' self'@(Scalar x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeOpt 1 18 x'2 + P'.wireSizeOpt 1 4 x'3 + P'.wireSizeOpt 1 12 x'4 +
             P'.wireSizeOpt 1 1 x'5
             + P'.wireSizeOpt 1 2 x'6
             + P'.wireSizeOpt 1 8 x'7
             + P'.wireSizeOpt 1 11 x'8)
  wirePut ft' self'@(Scalar x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
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
             P'.wirePutOpt 16 18 x'2
             P'.wirePutOpt 24 4 x'3
             P'.wirePutOpt 42 12 x'4
             P'.wirePutOpt 49 1 x'5
             P'.wirePutOpt 61 2 x'6
             P'.wirePutOpt 64 8 x'7
             P'.wirePutOpt 74 11 x'8
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = new'Field}) (P'.wireGet 14)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{v_signed_int = Prelude'.Just new'Field}) (P'.wireGet 18)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{v_unsigned_int = Prelude'.Just new'Field}) (P'.wireGet 4)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{v_opaque = Prelude'.Just new'Field}) (P'.wireGet 12)
             49 -> Prelude'.fmap (\ !new'Field -> old'Self{v_double = Prelude'.Just new'Field}) (P'.wireGet 1)
             61 -> Prelude'.fmap (\ !new'Field -> old'Self{v_float = Prelude'.Just new'Field}) (P'.wireGet 2)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{v_bool = Prelude'.Just new'Field}) (P'.wireGet 8)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{v_string = P'.mergeAppend (v_string old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> Scalar) Scalar where
  getVal m' f' = f' m'
 
instance P'.GPB Scalar
 
instance P'.ReflectDescriptor Scalar where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 16, 24, 42, 49, 61, 64, 74])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Scalar\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\"], baseName = MName \"Scalar\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Datatypes\",\"Scalar.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Scalar.type\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Scalar\"], baseName' = FName \"type'\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Scalar.Type\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Scalar\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Scalar.v_signed_int\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Scalar\"], baseName' = FName \"v_signed_int\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 18}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Scalar.v_unsigned_int\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Scalar\"], baseName' = FName \"v_unsigned_int\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Scalar.v_opaque\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Scalar\"], baseName' = FName \"v_opaque\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Scalar.v_double\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Scalar\"], baseName' = FName \"v_double\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 49}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Scalar.v_float\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Scalar\"], baseName' = FName \"v_float\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 61}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Scalar.v_bool\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Scalar\"], baseName' = FName \"v_bool\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Datatypes.Scalar.v_string\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Scalar\"], baseName' = FName \"v_string\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Scalar.String\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\",MName \"Scalar\"], baseName = MName \"String\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType Scalar where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg Scalar where
  textPut msg
   = do
       P'.tellT "type" (type' msg)
       P'.tellT "v_signed_int" (v_signed_int msg)
       P'.tellT "v_unsigned_int" (v_unsigned_int msg)
       P'.tellT "v_opaque" (v_opaque msg)
       P'.tellT "v_double" (v_double msg)
       P'.tellT "v_float" (v_float msg)
       P'.tellT "v_bool" (v_bool msg)
       P'.tellT "v_string" (v_string msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'type', parse'v_signed_int, parse'v_unsigned_int, parse'v_opaque, parse'v_double, parse'v_float,
                   parse'v_bool, parse'v_string])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{type' = v}))
        parse'v_signed_int
         = P'.try
            (do
               v <- P'.getT "v_signed_int"
               Prelude'.return (\ o -> o{v_signed_int = v}))
        parse'v_unsigned_int
         = P'.try
            (do
               v <- P'.getT "v_unsigned_int"
               Prelude'.return (\ o -> o{v_unsigned_int = v}))
        parse'v_opaque
         = P'.try
            (do
               v <- P'.getT "v_opaque"
               Prelude'.return (\ o -> o{v_opaque = v}))
        parse'v_double
         = P'.try
            (do
               v <- P'.getT "v_double"
               Prelude'.return (\ o -> o{v_double = v}))
        parse'v_float
         = P'.try
            (do
               v <- P'.getT "v_float"
               Prelude'.return (\ o -> o{v_float = v}))
        parse'v_bool
         = P'.try
            (do
               v <- P'.getT "v_bool"
               Prelude'.return (\ o -> o{v_bool = v}))
        parse'v_string
         = P'.try
            (do
               v <- P'.getT "v_string"
               Prelude'.return (\ o -> o{v_string = v}))