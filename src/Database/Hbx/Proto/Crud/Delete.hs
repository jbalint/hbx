{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Crud.Delete (Delete(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Database.Hbx.Proto.Crud.Collection as Database.Hbx.Proto.Crud (Collection)
import qualified Database.Hbx.Proto.Crud.DataModel as Database.Hbx.Proto.Crud (DataModel)
import qualified Database.Hbx.Proto.Crud.Limit as Database.Hbx.Proto.Crud (Limit)
import qualified Database.Hbx.Proto.Crud.Order as Database.Hbx.Proto.Crud (Order)
import qualified Database.Hbx.Proto.Datatypes.Scalar as Database.Hbx.Proto.Datatypes (Scalar)
import qualified Database.Hbx.Proto.Expr.Expr as Database.Hbx.Proto.Expr (Expr)
 
data Delete = Delete{collection :: !(Database.Hbx.Proto.Crud.Collection),
                     data_model :: !(P'.Maybe Database.Hbx.Proto.Crud.DataModel),
                     criteria :: !(P'.Maybe Database.Hbx.Proto.Expr.Expr), args :: !(P'.Seq Database.Hbx.Proto.Datatypes.Scalar),
                     limit :: !(P'.Maybe Database.Hbx.Proto.Crud.Limit), order :: !(P'.Seq Database.Hbx.Proto.Crud.Order)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable Delete where
  mergeAppend (Delete x'1 x'2 x'3 x'4 x'5 x'6) (Delete y'1 y'2 y'3 y'4 y'5 y'6)
   = Delete (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
 
instance P'.Default Delete where
  defaultValue = Delete P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
 
instance P'.Wire Delete where
  wireSize ft' self'@(Delete x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeOpt 1 14 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeRep 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeRep 1 11 x'6)
  wirePut ft' self'@(Delete x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 10 11 x'1
             P'.wirePutOpt 16 14 x'2
             P'.wirePutOpt 26 11 x'3
             P'.wirePutOpt 34 11 x'5
             P'.wirePutRep 42 11 x'6
             P'.wirePutRep 50 11 x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{collection = P'.mergeAppend (collection old'Self) (new'Field)})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{data_model = Prelude'.Just new'Field}) (P'.wireGet 14)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{criteria = P'.mergeAppend (criteria old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{args = P'.append (args old'Self) new'Field}) (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{limit = P'.mergeAppend (limit old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{order = P'.append (order old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> Delete) Delete where
  getVal m' f' = f' m'
 
instance P'.GPB Delete
 
instance P'.ReflectDescriptor Delete where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 16, 26, 34, 42, 50])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Crud.Delete\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\"], baseName = MName \"Delete\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Crud\",\"Delete.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.Delete.collection\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"Delete\"], baseName' = FName \"collection\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Crud.Collection\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\"], baseName = MName \"Collection\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.Delete.data_model\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"Delete\"], baseName' = FName \"data_model\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Crud.DataModel\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\"], baseName = MName \"DataModel\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.Delete.criteria\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"Delete\"], baseName' = FName \"criteria\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.Expr\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"Expr\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.Delete.args\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"Delete\"], baseName' = FName \"args\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Scalar\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\"], baseName = MName \"Scalar\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.Delete.limit\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"Delete\"], baseName' = FName \"limit\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Crud.Limit\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\"], baseName = MName \"Limit\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.Delete.order\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"Delete\"], baseName' = FName \"order\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Crud.Order\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\"], baseName = MName \"Order\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType Delete where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg Delete where
  textPut msg
   = do
       P'.tellT "collection" (collection msg)
       P'.tellT "data_model" (data_model msg)
       P'.tellT "criteria" (criteria msg)
       P'.tellT "args" (args msg)
       P'.tellT "limit" (limit msg)
       P'.tellT "order" (order msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'collection, parse'data_model, parse'criteria, parse'args, parse'limit, parse'order])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'collection
         = P'.try
            (do
               v <- P'.getT "collection"
               Prelude'.return (\ o -> o{collection = v}))
        parse'data_model
         = P'.try
            (do
               v <- P'.getT "data_model"
               Prelude'.return (\ o -> o{data_model = v}))
        parse'criteria
         = P'.try
            (do
               v <- P'.getT "criteria"
               Prelude'.return (\ o -> o{criteria = v}))
        parse'args
         = P'.try
            (do
               v <- P'.getT "args"
               Prelude'.return (\ o -> o{args = P'.append (args o) v}))
        parse'limit
         = P'.try
            (do
               v <- P'.getT "limit"
               Prelude'.return (\ o -> o{limit = v}))
        parse'order
         = P'.try
            (do
               v <- P'.getT "order"
               Prelude'.return (\ o -> o{order = P'.append (order o) v}))