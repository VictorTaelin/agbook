module Data.U64.div where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.Type
open import Data.U64.if
open import Data.U64.lte
open import Data.U64.min

divU64 : U64 → U64 → U64
divU64 x y = primWord64FromNat (go (primWord64ToNat x) (primWord64ToNat y))
  where
    go : Nat → Nat → Nat
    go Zero _ = Zero
    go _ Zero = Zero  -- Handle division by zero
    go m n = ifU64 (lteU64 (primWord64FromNat m) (primWord64FromNat n) )
             Zero
             (Succ (go (primWord64ToNat (minU64 (primWord64FromNat m) (primWord64FromNat n))) n))
    


