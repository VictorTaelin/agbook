module Data.Bits.eq where

open import Data.Bits.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Trait.Eq

instance
  EqBits : Eq Bits
  EqBits = record
    { eq = eq-bits
    ; neq = neq-bits
    }
    where
      eq-bits : Bits → Bits → Bool
      eq-bits E E = True
      eq-bits (O x) (O y) = eq-bits x y
      eq-bits (I x) (I y) = eq-bits x y
      eq-bits _ _ = False

      neq-bits : Bits → Bits → Bool
      neq-bits x y = not (eq-bits x y)