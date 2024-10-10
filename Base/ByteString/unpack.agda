module Base.ByteString.unpack where

open import Base.ByteString.ByteString
open import Base.List.List
open import Base.Word8.Word8

postulate unpack : ByteString → List Word8

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC unpack = BS.unpack #-}

