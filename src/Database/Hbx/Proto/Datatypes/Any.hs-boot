{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Database.Hbx.Proto.Datatypes.Any (Any) where
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
data Any
 
instance P'.MessageAPI msg' (msg' -> Any) Any
 
instance Prelude'.Show Any
 
instance Prelude'.Eq Any
 
instance Prelude'.Ord Any
 
instance Prelude'.Typeable Any
 
instance Prelude'.Data Any
 
instance P'.Mergeable Any
 
instance P'.Default Any
 
instance P'.Wire Any
 
instance P'.GPB Any
 
instance P'.ReflectDescriptor Any
 
instance P'.TextType Any
 
instance P'.TextMsg Any