{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Crud.Projection (Projection(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Database.Hbx.Proto.Expr.Expr as Database.Hbx.Proto.Expr (Expr)
 
data Projection = Projection{source :: !(Database.Hbx.Proto.Expr.Expr), alias :: !(P'.Maybe P'.Utf8)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable Projection where
  mergeAppend (Projection x'1 x'2) (Projection y'1 y'2) = Projection (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default Projection where
  defaultValue = Projection P'.defaultValue P'.defaultValue
 
instance P'.Wire Projection where
  wireSize ft' self'@(Projection x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeOpt 1 9 x'2)
  wirePut ft' self'@(Projection x'1 x'2)
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
             P'.wirePutOpt 18 9 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{source = P'.mergeAppend (source old'Self) (new'Field)}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{alias = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> Projection) Projection where
  getVal m' f' = f' m'
 
instance P'.GPB Projection
 
instance P'.ReflectDescriptor Projection where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Crud.Projection\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\"], baseName = MName \"Projection\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Crud\",\"Projection.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.Projection.source\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"Projection\"], baseName' = FName \"source\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Expr.Expr\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Expr\"], baseName = MName \"Expr\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Crud.Projection.alias\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Crud\",MName \"Projection\"], baseName' = FName \"alias\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"
 
instance P'.TextType Projection where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage
 
instance P'.TextMsg Projection where
  textPut msg
   = do
       P'.tellT "source" (source msg)
       P'.tellT "alias" (alias msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'source, parse'alias]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{source = v}))
        parse'alias
         = P'.try
            (do
               v <- P'.getT "alias"
               Prelude'.return (\ o -> o{alias = v}))