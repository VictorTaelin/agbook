module Data.Map.Tm.get-set where

open import Data.Bits.Type
open import Data.Equal.Type
open import Data.Map.Type
open import Data.Map.get
open import Data.Map.set
open import Data.Maybe.Type

-- Theorem: Setting a value and then getting it returns the same value
get-set : ∀ {A : Set} (m : Map A) (k : Bits) (v : A) → get (set m k v) k == Some v
get-set (Node _   lft rgt) E     v = refl
get-set (Node val lft rgt) (O k) v = get-set lft k v
get-set (Node val lft rgt) (I k) v = get-set rgt k v
get-set Leaf               E     v = refl
get-set Leaf               (O k) v = get-set Leaf k v
get-set Leaf               (I k) v = get-set Leaf k v
