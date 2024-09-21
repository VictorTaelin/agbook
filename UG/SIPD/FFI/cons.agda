module UG.SIPD.FFI.cons where

open import UG.SIPD.FFI.Word8
open import UG.SIPD.FFI.ByteString

postulate cons : Word8 -> ByteString -> ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC cons = BS.cons #-}
