{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Connection (protoInfo, fileDescriptorProto) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import Text.DescriptorProtos.FileDescriptorProto (FileDescriptorProto)
import Text.ProtocolBuffers.Reflections (ProtoInfo)
import qualified Text.ProtocolBuffers.WireMessage as P' (wireGet,getFromBS)
 
protoInfo :: ProtoInfo
protoInfo
 = Prelude'.read
    "ProtoInfo {protoMod = ProtoName {protobufName = FIName \".Mysqlx.Connection\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\"], baseName = MName \"Connection\"}, protoFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Connection.hs\"], protoSource = \"src/mysqlx_connection.proto\", extensionKeys = fromList [], messages = [DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Connection.Capability\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\"], baseName = MName \"Capability\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Connection\",\"Capability.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Connection.Capability.name\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\",MName \"Capability\"], baseName' = FName \"name\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Connection.Capability.value\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\",MName \"Capability\"], baseName' = FName \"value\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Datatypes.Any\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Datatypes\"], baseName = MName \"Any\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Connection.Capabilities\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\"], baseName = MName \"Capabilities\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Connection\",\"Capabilities.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Connection.Capabilities.capabilities\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\",MName \"Capabilities\"], baseName' = FName \"capabilities\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Connection.Capability\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\"], baseName = MName \"Capability\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Connection.CapabilitiesGet\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\"], baseName = MName \"CapabilitiesGet\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Connection\",\"CapabilitiesGet.hs\"], isGroup = False, fields = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Connection.CapabilitiesSet\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\"], baseName = MName \"CapabilitiesSet\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Connection\",\"CapabilitiesSet.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Mysqlx.Connection.CapabilitiesSet.capabilities\", haskellPrefix' = [], parentModule' = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\",MName \"CapabilitiesSet\"], baseName' = FName \"capabilities\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Mysqlx.Connection.Capabilities\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\"], baseName = MName \"Capabilities\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".Mysqlx.Connection.Close\", haskellPrefix = [], parentModule = [MName \"Database\",MName \"Hbx\",MName \"Proto\",MName \"Connection\"], baseName = MName \"Close\"}, descFilePath = [\"Database\",\"Hbx\",\"Proto\",\"Connection\",\"Close.hs\"], isGroup = False, fields = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}], enums = [], knownKeyMap = fromList []}"
 
fileDescriptorProto :: FileDescriptorProto
fileDescriptorProto
 = P'.getFromBS (P'.wireGet 11)
    (P'.pack
      "\230\STX\n\ESCsrc/mysqlx_connection.proto\DC2\DC1Mysqlx.Connection\SUB\SYNmysqlx_datatypes.proto\"@\n\nCapability\DC2\f\n\EOTname\CAN\SOH \STX(\t\DC2$\n\ENQvalue\CAN\STX \STX(\v2\NAK.Mysqlx.Datatypes.Any\"C\n\fCapabilities\DC23\n\fcapabilities\CAN\SOH \ETX(\v2\GS.Mysqlx.Connection.Capability\"\DC1\n\SICapabilitiesGet\"H\n\SICapabilitiesSet\DC25\n\fcapabilities\CAN\SOH \STX(\v2\US.Mysqlx.Connection.Capabilities\"\a\n\ENQCloseB/\n\GSdatabase.hbx.proto.connectionH\SOHP\NUL\128\SOH\NUL\136\SOH\NUL\144\SOH\NUL\160\SOH\NUL")