module Base.ByteString.pack where

open import Base.ByteString.Type
open import Base.List.Type
open import Base.String.Type
open import Base.Word8.Type

postulate pack : List Word8 -> ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC pack = BS.pack #-}
