module UG.SIPD.FFI.show where

open import UG.SIPD.FFI.ByteString
open import Data.String.Type

postulate show : ByteString -> String

{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# COMPILE GHC show =  T.pack . show #-}
