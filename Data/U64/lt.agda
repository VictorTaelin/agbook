module Data.U64.lt where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.Type 

ltU64 : U64 → U64 → U64
ltU64 x y = go (primWord64ToNat x) (primWord64ToNat y)
  where
    go : Nat → Nat → U64
    go Zero Zero = primWord64FromNat 0
    go Zero (Succ _) = primWord64FromNat 1
    go (Succ _) Zero = primWord64FromNat 0
    go (Succ m) (Succ n) = go m n
