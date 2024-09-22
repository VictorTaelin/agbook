module Base.ByteString.tail where

open import Base.ByteString.Type

postulate tail : ByteString -> ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC tail = BS.tail #-}
