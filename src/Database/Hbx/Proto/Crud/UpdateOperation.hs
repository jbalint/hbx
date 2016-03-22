{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Crud.UpdateOperation (UpdateOperation(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Database.Hbx.Proto.Crud.UpdateOperation.UpdateType as Database.Hbx.Proto.Crud.UpdateOperation (UpdateType)
import qualified Database.Hbx.Proto.Expr.ColumnIdentifier as Database.Hbx.Proto.Expr (ColumnIdentifier)
import qualified Database.Hbx.Proto.Expr.Expr as Database.Hbx.Proto.Expr (Expr)
 
data UpdateOperation = UpdateOperation{source :: !(Database.Hbx.Proto.Expr.ColumnIdentifier),
                                       operation :: !(Database.Hbx.Proto.Crud.UpdateOperation.UpdateType),
                                       value :: !(P'.Maybe Database.Hbx.Proto.Expr.Expr)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable UpdateOperation where
  mergeAppend (UpdateOperation x'1 x'2 x'3) (UpdateOperation y'1 y'2 y'3)
   = UpdateOperation (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)
 
instance P'.Default UpdateOperation where
  defaultValue = UpdateOperation P'.defaultValue P'.defaultValue P'.defaultValue
 
instance P'.Wire UpdateOperation where
  wireSize ft' self'@(UpdateOperation x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 14 x'2 + P'.wireSizeOpt 1 11 x'3)
  wirePut ft' self'@(UpdateOperation x'1 x'2 x'3)
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
             P'.wirePutReq 16 14 x'2
             P'.wirePutOpt 26 11 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{source = P'.mergeAppend (source old'Self) (new'Field)}) (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{operation = new'Field}) (P'.wireGet 14)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{value = P'.mergeAppend (value old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> UpdateOperation) UpdateOperation where
  getVal m' f' = f' m'
 
instance P'.GPB UpdateOperation
 
instance P'.ReflectDescriptor UpdateOperation where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16]) (P'.fromDistinctAscList [10, 16, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Crud.UpdateOperation\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\"], baseName = MName \"UpdateOperation\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Crud\",\"UpdateOperation.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.UpdateOperation.source\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"UpdateOperation\"], baseName' = FName \"source\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.ColumnIdentifier\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"ColumnIdentifier\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.UpdateOperation.operation\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"UpdateOperation\"], baseName' = FName \"operation\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Crud.UpdateOperation.UpdateType\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"UpdateOperation\"], baseName = MName \"UpdateType\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.UpdateOperation.value\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"UpdateOperation\"], baseName' = FName \"value\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.Expr\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"Expr\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType UpdateOperation where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg UpdateOperation where
  textPut msg
   = do
       P'.tellT "source" (source msg)
       P'.tellT "operation" (operation msg)
       P'.tellT "value" (value msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'source, parse'operation, parse'value]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{source = v}))
        parse'operation
         = P'.try
            (do
               v <- P'.getT "operation"
               Prelude'.return (\ o -> o{operation = v}))
        parse'value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{value = v}))