module Data.U64.lte where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.Type

lte : U64 → U64 → U64
lte x y = helper (primWord64ToNat x) (primWord64ToNat y)
  where
    helper : Nat → Nat → U64
    helper Zero Zero = primWord64FromNat 1
    helper Zero (Succ _) = primWord64FromNat 1
    helper (Succ _) Zero = primWord64FromNat 0
    helper (Succ m) (Succ n) = helper m n

infix 4 _<=_

_<=_ : U64 → U64 → U64
_<=_ = lte
