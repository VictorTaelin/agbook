module Data.Int.eq where

open import Data.Trait.Eq
open import Data.Trait.Eq.from-ord
open import Data.Int.Type
open import Data.Int.ord

-- Derives the Eq instance for Int from its Ord instance.
int-eq : Eq Int
int-eq = from-ord int-ord
