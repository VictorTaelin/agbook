module Data.Int.to-bits where

open import Data.Bits.Type
open import Data.Bits.inc
open import Data.Bits.not
open import Data.Int.Type
open import Data.Nat.to-bits renaming (to-bits to nat-to-bits)

to-bits : Int → Bits
to-bits (Pos n) = nat-to-bits n
to-bits (Neg n) = inc (not (nat-to-bits n))
