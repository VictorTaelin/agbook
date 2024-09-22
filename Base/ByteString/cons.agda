module Base.ByteString.cons where

open import Base.Word8.Type
open import Base.ByteString.Type

postulate cons : Word8 -> ByteString -> ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC cons = BS.cons #-}
