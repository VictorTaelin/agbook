module Data.U64.lte where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.Type

lte : U64 → U64 → U64
lte x y = go (primWord64ToNat x) (primWord64ToNat y)
  where
    go : Nat → Nat → U64
    go Zero Zero = primWord64FromNat 1
    go Zero (Succ _) = primWord64FromNat 1
    go (Succ _) Zero = primWord64FromNat 0
    go (Succ m) (Succ n) = go m n

infix 4 _<=_

_<=_ : U64 → U64 → U64
_<=_ = lte
