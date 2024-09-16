module Data.U64.div where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.Type
open import Data.U64.if
open import Data.U64.lte
open import Data.U64.min

div : U64 → U64 → U64
div x y = primWord64FromNat (go (primWord64ToNat x) (primWord64ToNat y))
  where
    go : Nat → Nat → Nat
    go Zero _ = Zero
    go _ Zero = Zero  -- Handle division by zero
    go m n = if (lte (primWord64FromNat m) (primWord64FromNat n) )
             then Zero
             else (Succ (go (primWord64ToNat (min (primWord64FromNat m) (primWord64FromNat n))) n))

infix 8 _/_
_/_ = div
