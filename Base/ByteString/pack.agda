module Base.ByteString.pack where

open import Base.ByteString.ByteString
open import Base.List.List
open import Base.String.String
open import Base.Word8.Word8

postulate pack : List Word8 → ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC pack = BS.pack #-}
