module Base.ByteString.take where

open import Base.ByteString.Type
open import Base.Nat.Type

postulate take : Nat -> ByteString -> ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC take = BS.take #-}
