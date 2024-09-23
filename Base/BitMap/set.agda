module Base.BitMap.set where

open import Base.BitMap.Type
open import Base.Bits.Type
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Maybe.Type
open import Base.TreeBin.Type

-- Inserts a key-value pair into the BitMap.
-- - m: The BitMap to insert into.
-- - k: The Bits key to insert.
-- - v: The value to associate with the key.
-- = A new BitMap with the key-value pair inserted.
set : ∀ {A : Set} -> BitMap A -> Bits -> A -> BitMap A
set (Node val lft rgt) E     v = Node (Some v) lft rgt
set (Node val lft rgt) (O k) v = Node val (set lft k v) rgt
set (Node val lft rgt) (I k) v = Node val lft (set rgt k v)
set Leaf               E     v = Node (Some v) Leaf Leaf
set Leaf               (O k) v = Node None (set Leaf k v) Leaf
set Leaf               (I k) v = Node None Leaf (set Leaf k v)
