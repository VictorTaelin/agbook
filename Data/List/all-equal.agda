module Data.List.all-equal where

open import Data.List.Type
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Trait.Eq
open import Data.Equal.Type

all-equal : ∀ {A : Set} {{EqA : Eq A}} → List A → Bool
all-equal [] = True
all-equal (x :: []) = True
all-equal (x :: y :: xs) = (x == y) && all-equal (y :: xs)