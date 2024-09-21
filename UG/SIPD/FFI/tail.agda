module UG.SIPD.FFI.tail where

open import UG.SIPD.FFI.ByteString

postulate tail : ByteString -> ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC tail = BS.tail #-}
