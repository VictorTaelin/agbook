module Data.Word8.from-nat where

open import Data.Word8.Type
open import Data.Nat.Type

postulate
  from-nat : Nat → Word8

{-# FOREIGN GHC import GHC.Word #-}
{-# COMPILE GHC from-nat = fromIntegral #-}
{-# COMPILE JS  from-nat = function (x) { return x & 0xFF; } #-} -- TODO: test
