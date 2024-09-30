module Base.ByteString.head where

open import Base.ByteString.ByteString
open import Base.Word8.Word8

postulate head : ByteString → Word8

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC head = BS.head #-}
