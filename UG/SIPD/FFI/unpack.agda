module UG.SIPD.FFI.unpack where

open import UG.SIPD.FFI.ByteString
open import UG.SIPD.FFI.Word8
open import Data.List.Type

postulate unpack : ByteString -> List Word8

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC unpack = BS.unpack #-}
