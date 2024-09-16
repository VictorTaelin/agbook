module Data.Vector.all-equal where

open import Data.Vector.Type
open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Trait.Eq


all-equal : ∀ {A : Set} {n : Nat} {{EqA : Eq A}} → Vector A n → Bool
all-equal [] = True
all-equal (x :: []) = True
all-equal (x :: y :: xs) = (x == y) && all-equal (y :: xs)

