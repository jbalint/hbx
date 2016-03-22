{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Expr.Object.ObjectField (ObjectField(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import {-# SOURCE #-} qualified Database.Hbx.Proto.Expr.Expr as Database.Hbx.Proto.Expr (Expr)
 
data ObjectField = ObjectField{key :: !(P'.Utf8), value :: !(Database.Hbx.Proto.Expr.Expr)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable ObjectField where
  mergeAppend (ObjectField x'1 x'2) (ObjectField y'1 y'2) = ObjectField (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default ObjectField where
  defaultValue = ObjectField P'.defaultValue P'.defaultValue
 
instance P'.Wire ObjectField where
  wireSize ft' self'@(ObjectField x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeReq 1 11 x'2)
  wirePut ft' self'@(ObjectField x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 10 9 x'1
             P'.wirePutReq 18 11 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{key = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{value = P'.mergeAppend (value old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> ObjectField) ObjectField where
  getVal m' f' = f' m'
 
instance P'.GPB ObjectField
 
instance P'.ReflectDescriptor ObjectField where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Expr.Object.ObjectField\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Object\"], baseName = MName \"ObjectField\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Expr\",\"Object\",\"ObjectField.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Object.ObjectField.key\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Object\",MName \"ObjectField\"], baseName' = FName \"key\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Expr.Object.ObjectField.value\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\",MName \"Object\",MName \"ObjectField\"], baseName' = FName \"value\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.Expr\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"Expr\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType ObjectField where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg ObjectField where
  textPut msg
   = do
       P'.tellT "key" (key msg)
       P'.tellT "value" (value msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'key, parse'value]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'key
         = P'.try
            (do
               v <- P'.getT "key"
               Prelude'.return (\ o -> o{key = v}))
        parse'value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{value = v}))