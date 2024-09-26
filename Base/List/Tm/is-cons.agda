module Base.List.Tm.is-cons where

open import Base.List.List
open import Base.List.is-cons
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Proof that is-cons returns False for an empty list
is-cons-empty : ∀ {A : Set} -> is-cons {A} [] ≡ False
is-cons-empty = refl

-- Proof that is-cons returns True for a non-empty list
is-cons-cons : ∀ {A : Set} (x : A) (xs : List A) -> is-cons (x :: xs) ≡ True
is-cons-cons _ _ = refl
