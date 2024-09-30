module Base.ByteString.take where

open import Base.ByteString.ByteString
open import Base.Nat.Nat

postulate take : Nat → ByteString → ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC take = BS.take #-}
