module Data.Map.tm-get-set where

open import Data.Bits.Type
open import Data.Equal.Type
open import Data.Map.Type
open import Data.Map.get
open import Data.Map.set
open import Data.Maybe.Type

-- Theorem: Setting a value and then getting it returns the same value
tm-get-set : ∀ {A : Set} (m : Map A) (k : Bits) (v : A) → get (set m k v) k == some v
tm-get-set (node _   lft rgt) e     v = refl
tm-get-set (node val lft rgt) (o k) v = tm-get-set lft k v
tm-get-set (node val lft rgt) (i k) v = tm-get-set rgt k v
tm-get-set leaf               e     v = refl
tm-get-set leaf               (o k) v = tm-get-set leaf k v
tm-get-set leaf               (i k) v = tm-get-set leaf k v
