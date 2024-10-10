module Base.BinMap.ini where

open import Base.BinMap.BinMap
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.BinTree.BinTree

-- Initializes an entry in the BinMap if it doesn't already exist.
-- - m: The BinMap to initialize the entry in.
-- - k: The Bits key for the entry.
-- - v: The value to initialize the entry with.
-- = A new BinMap with the entry initialized if it didn't exist before.
ini : ∀ {A : Set} → BinMap A → Bits → A → BinMap A
ini (Node (Some x) l r) E     v = Node (Some x) l r
ini (Node None     l r) E     v = Node (Some v) l r
ini (Node val      l r) (O k) v = Node val (ini l k v) r
ini (Node val      l r) (I k) v = Node val l (ini r k v)
ini Leaf                E     v = Node (Some v) Leaf Leaf
ini Leaf                (O k) v = Node None (ini Leaf k v) Leaf
ini Leaf                (I k) v = Node None Leaf (ini Leaf k v)

