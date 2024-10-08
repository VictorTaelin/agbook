module Base.BinMap.set where

open import Base.BinMap.BinMap
open import Base.Bits.Bits
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Maybe.Maybe
open import Base.BinTree.BinTree

-- Inserts a key-value pair into the BinMap.
-- - m: The BinMap to insert into.
-- - k: The Bits key to insert.
-- - v: The value to associate with the key.
-- = A new BinMap with the key-value pair inserted.
set : ∀ {A : Set} → BinMap A → Bits → A → BinMap A
set (Node val l r) E     v = Node (Some v) l r
set (Node val l r) (O k) v = Node val (set l k v) r
set (Node val l r) (I k) v = Node val l (set r k v)
set Leaf           E     v = Node (Some v) Leaf Leaf
set Leaf           (O k) v = Node None (set Leaf k v) Leaf
set Leaf           (I k) v = Node None Leaf (set Leaf k v)
