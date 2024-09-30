module Base.BitMap.Tm.get-set where

open import Base.Bits.Bits
open import Base.Equal.Equal
open import Base.BitMap.BitMap
open import Base.BitMap.get
open import Base.BitMap.set
open import Base.Maybe.Maybe

-- Theorem: Setting a value and then getting it returns the same value
get-set : ∀ {A : Set} (m : BitMap A) (k : Bits) (v : A) → get (set m k v) k ≡ Some v
get-set (Node _   lft rgt) E     v = refl
get-set (Node val lft rgt) (O k) v = get-set lft k v
get-set (Node val lft rgt) (I k) v = get-set rgt k v
get-set Leaf               E     v = refl
get-set Leaf               (O k) v = get-set Leaf k v
get-set Leaf               (I k) v = get-set Leaf k v
