module Base.ByteString.unpack where

open import Base.ByteString.Type
open import Base.List.Type
open import Base.Word8.Type

postulate unpack : ByteString -> List Word8

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC unpack = BS.unpack #-}
