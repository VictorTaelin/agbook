module Data.Word8.to-nat where

open import Data.Word8.Type
open import Data.Nat.Type

postulate
  to-nat : Word8 → Nat

{-# FOREIGN GHC import GHC.Word #-}
{-# COMPILE GHC to-nat = fromIntegral #-}
{-# COMPILE JS  to-nat = function (x) { return x; } #-} -- TODO: test

open import Data.Word8.from-nat

open import Data.Equal.Type
equals1 : to-nat (from-nat 1) == 1
equals1 = refl
-- to-nat (from-nat 1) != 1 of type Nat