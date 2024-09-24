module Base.BitMap.set where

open import Base.BitMap.Type
open import Base.Bits.Type
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Maybe.Type
open import Base.BinTree.Type

-- Inserts a key-value pair into the BitMap.
-- - m: The BitMap to insert into.
-- - k: The Bits key to insert.
-- - v: The value to associate with the key.
-- = A new BitMap with the key-value pair inserted.
set : ∀ {A : Set} -> BitMap A -> Bits -> A -> BitMap A
set (Node val l r) E     v = Node (Some v) l r
set (Node val l r) (O k) v = Node val (set l k v) r
set (Node val l r) (I k) v = Node val l (set r k v)
set Leaf           E     v = Node (Some v) Leaf Leaf
set Leaf           (O k) v = Node None (set Leaf k v) Leaf
set Leaf           (I k) v = Node None Leaf (set Leaf k v)
