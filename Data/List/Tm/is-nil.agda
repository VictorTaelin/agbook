module Data.List.Tm.is-nil where

open import Data.List.Type
open import Data.List.is-nil
open import Data.Bool.Type
open import Data.Equal.Type

-- Proof that is-nil returns True for an empty list
is-nil-empty : ∀ {A : Set} → is-nil {A} [] === True
is-nil-empty = refl

-- Proof that is-nil returns False for a non-empty list
is-nil-cons : ∀ {A : Set} (x : A) (xs : List A) → is-nil (x :: xs) === False
is-nil-cons _ _ = refl
