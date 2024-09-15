module Data.Float.to-bits where

open import Data.Function.case
open import Data.Bits.Type
open import Data.Float.Type
open import Data.Maybe.Type
open import Data.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Data.U64.Type

to-bits : Float → Bits
to-bits n = case primFloatToWord64 n of λ where
  (Some w) → nat-to-bits (primWord64ToNat w)
  None → E
