module Base.BinMap.Tm.get-set where

open import Base.Bits.Bits
open import Base.Equal.Equal
open import Base.BinMap.BinMap
open import Base.BinMap.get
open import Base.BinMap.set
open import Base.Maybe.Maybe

-- Theorem: Setting a value and then getting it returns the same value
get-set : ∀ {A : Set} (m : BinMap A) (k : Bits) (v : A) → get (set m k v) k ≡ Some v
get-set (Node _   lft rgt) E     v = refl
get-set (Node val lft rgt) (O k) v = get-set lft k v
get-set (Node val lft rgt) (I k) v = get-set rgt k v
get-set Leaf               E     v = refl
get-set Leaf               (O k) v = get-set Leaf k v
get-set Leaf               (I k) v = get-set Leaf k v

