{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Expr.Expr (Expr(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Database.Hbx.Proto.Datatypes.Scalar as Database.Hbx.Proto.Datatypes (Scalar)
import qualified Database.Hbx.Proto.Expr.Array as Database.Hbx.Proto.Expr (Array)
import qualified Database.Hbx.Proto.Expr.ColumnIdentifier as Database.Hbx.Proto.Expr (ColumnIdentifier)
import qualified Database.Hbx.Proto.Expr.Expr.Type as Database.Hbx.Proto.Expr.Expr (Type)
import qualified Database.Hbx.Proto.Expr.FunctionCall as Database.Hbx.Proto.Expr (FunctionCall)
import qualified Database.Hbx.Proto.Expr.Object as Database.Hbx.Proto.Expr (Object)
import qualified Database.Hbx.Proto.Expr.Operator as Database.Hbx.Proto.Expr (Operator)
 
data Expr = Expr{type' :: !(Database.Hbx.Proto.Expr.Expr.Type), identifier :: !(P'.Maybe Database.Hbx.Proto.Expr.ColumnIdentifier),
                 variable :: !(P'.Maybe P'.Utf8), literal :: !(P'.Maybe Database.Hbx.Proto.Datatypes.Scalar),
                 function_call :: !(P'.Maybe Database.Hbx.Proto.Expr.FunctionCall),
                 operator :: !(P'.Maybe Database.Hbx.Proto.Expr.Operator), position :: !(P'.Maybe P'.Word32),
                 object :: !(P'.Maybe Database.Hbx.Proto.Expr.Object), array :: !(P'.Maybe Database.Hbx.Proto.Expr.Array)}
          deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable Expr where
  mergeAppend (Expr x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9) (Expr y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9)
   = Expr (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
 
instance P'.Default Expr where
  defaultValue
   = Expr P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
 
instance P'.Wire Expr where
  wireSize ft' self'@(Expr x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 11 x'9)
  wirePut ft' self'@(Expr x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
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
             P'.wirePutOpt 26 9 x'3
             P'.wirePutOpt 34 11 x'4
             P'.wirePutOpt 42 11 x'5
             P'.wirePutOpt 50 11 x'6
             P'.wirePutOpt 56 13 x'7
             P'.wirePutOpt 66 11 x'8
             P'.wirePutOpt 74 11 x'9
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{identifier = P'.mergeAppend (identifier old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{variable = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{literal = P'.mergeAppend (literal old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{function_call = P'.mergeAppend (function_call old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{operator = P'.mergeAppend (operator old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{position = Prelude'.Just new'Field}) (P'.wireGet 13)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{object = P'.mergeAppend (object old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{array = P'.mergeAppend (array old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> Expr) Expr where
  getVal m' f' = f' m'
 
instance P'.GPB Expr
 
instance P'.ReflectDescriptor Expr where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 18, 26, 34, 42, 50, 56, 66, 74])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Expr.Expr\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"Expr\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Expr\",\"Expr.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Expr.type\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Expr\"], baseName' = FName \"type'\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.Expr.Type\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Expr\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Expr.identifier\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Expr\"], baseName' = FName \"identifier\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.ColumnIdentifier\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"ColumnIdentifier\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Expr.variable\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Expr\"], baseName' = FName \"variable\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Expr.literal\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Expr\"], baseName' = FName \"literal\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Scalar\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\"], baseName = MName \"Scalar\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Expr.function_call\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Expr\"], baseName' = FName \"function_call\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.FunctionCall\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"FunctionCall\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Expr.operator\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Expr\"], baseName' = FName \"operator\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.Operator\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"Operator\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Expr.position\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Expr\"], baseName' = FName \"position\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Expr.object\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Expr\"], baseName' = FName \"object\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.Object\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"Object\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Expr.array\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Expr\"], baseName' = FName \"array\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.Array\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"Array\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType Expr where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg Expr where
  textPut msg
   = do
       P'.tellT "type" (type' msg)
       P'.tellT "identifier" (identifier msg)
       P'.tellT "variable" (variable msg)
       P'.tellT "literal" (literal msg)
       P'.tellT "function_call" (function_call msg)
       P'.tellT "operator" (operator msg)
       P'.tellT "position" (position msg)
       P'.tellT "object" (object msg)
       P'.tellT "array" (array msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'type', parse'identifier, parse'variable, parse'literal, parse'function_call, parse'operator,
                   parse'position, parse'object, parse'array])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{type' = v}))
        parse'identifier
         = P'.try
            (do
               v <- P'.getT "identifier"
               Prelude'.return (\ o -> o{identifier = v}))
        parse'variable
         = P'.try
            (do
               v <- P'.getT "variable"
               Prelude'.return (\ o -> o{variable = v}))
        parse'literal
         = P'.try
            (do
               v <- P'.getT "literal"
               Prelude'.return (\ o -> o{literal = v}))
        parse'function_call
         = P'.try
            (do
               v <- P'.getT "function_call"
               Prelude'.return (\ o -> o{function_call = v}))
        parse'operator
         = P'.try
            (do
               v <- P'.getT "operator"
               Prelude'.return (\ o -> o{operator = v}))
        parse'position
         = P'.try
            (do
               v <- P'.getT "position"
               Prelude'.return (\ o -> o{position = v}))
        parse'object
         = P'.try
            (do
               v <- P'.getT "object"
               Prelude'.return (\ o -> o{object = v}))
        parse'array
         = P'.try
            (do
               v <- P'.getT "array"
               Prelude'.return (\ o -> o{array = v}))