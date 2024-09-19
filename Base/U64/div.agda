module Base.U64.div where

open import Base.U64.Type
open import Base.U64.Ord
open import Base.Bool.Type
open import Base.Nat.Type
open import Base.U64.if
open import Base.U64.min
open import Base.U64.from-bool
open import Base.Ord.Trait

-- Division function for U64 (64-bit unsigned integers)
div : U64 → U64 → U64
div x y = primWord64FromNat (go (primWord64ToNat x) (primWord64ToNat y))
  where
    -- Helper function to perform division using natural numbers
    go : Nat → Nat → Nat
    go Zero _ = Zero
    go _ Zero = Zero  -- Handle division by zero
    go m n = if (from-bool (_<=_ {{OrdU64}} (primWord64FromNat m) (primWord64FromNat n)))
             then Zero
             else (Succ (go (primWord64ToNat (min (primWord64FromNat m) (primWord64FromNat n))) n))

-- Infix operator for division
infix 8 _/_
_/_ = div
