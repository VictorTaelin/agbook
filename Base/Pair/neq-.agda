module Base.Pair.neq- where

open import Base.Pair.Pair
open import Base.Pair.neq
open import Base.Nat.Nat
open import Base.Nat.Trait.Eq
open import Base.Bool.Bool
open import Base.Bool.Trait.Eq
open import Base.Equal.Equal

T2 : ((1 , True) != (1 , False)) ≡ True
T2 = refl

