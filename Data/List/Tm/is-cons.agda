module Data.List.Tm.is-cons where

open import Data.List.Type
open import Data.List.is-cons
open import Data.Bool.Type
open import Data.Equal.Type

-- Proof that is-cons returns False for an empty list
is-cons-empty : ∀ {A : Set} → is-cons {A} [] === False
is-cons-empty = refl

-- Proof that is-cons returns True for a non-empty list
is-cons-cons : ∀ {A : Set} (x : A) (xs : List A) → is-cons (x :: xs) === True
is-cons-cons _ _ = refl
