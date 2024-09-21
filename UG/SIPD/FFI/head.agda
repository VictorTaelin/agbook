module UG.SIPD.FFI.head where

open import UG.SIPD.FFI.Word8
open import UG.SIPD.FFI.ByteString

postulate head : ByteString -> Word8

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC head = BS.head #-}
