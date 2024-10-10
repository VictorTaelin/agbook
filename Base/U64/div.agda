module Base.U64.div where

open import Base.U64.U64
open import Base.U64.Trait.Ord
open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.U64.if
open import Base.U64.min
open import Base.U64.from-bool
open import Base.Trait.Ord
open import Base.U64.to-nat
open import Base.U64.from-nat

-- Division function for U64 (64-bit unsigned integers)
{-# TERMINATING #-} -- FIXME!
div : U64 → U64 → U64
div x y = from-nat (go (to-nat x) (to-nat y))
  where
    -- Helper function to perform division using natural numbers
    go : Nat → Nat → Nat
    go Zero _ = Zero
    go _ Zero = Zero  -- Handle division by zero
    go m n = if (from-bool (_<=_ {{OrdU64}} (from-nat m) (from-nat n)))
             then Zero
             else (Succ (go (to-nat (min (from-nat m) (from-nat n))) n))

-- Infix operator for division
infix 8 _/_
_/_ = div

