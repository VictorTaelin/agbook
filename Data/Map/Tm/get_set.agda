module Data.Map.Tm.get_set where

open import Data.Bits.Type
open import Data.Equal.Type
open import Data.Map.Type
open import Data.Map.get
open import Data.Map.set
open import Data.Maybe.Type

-- Theorem: Setting a value and then getting it returns the same value
get_set : ∀ {A : Set} (m : Map A) (k : Bits) (v : A) → get (set m k v) k == Some v
get_set (Node _   lft rgt) E     v = refl
get_set (Node val lft rgt) (O k) v = get_set lft k v
get_set (Node val lft rgt) (I k) v = get_set rgt k v
get_set Leaf               E     v = refl
get_set Leaf               (O k) v = get_set Leaf k v
get_set Leaf               (I k) v = get_set Leaf k v
