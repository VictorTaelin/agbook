module Base.BinMap.mut where

open import Base.BinMap.BinMap
open import Base.BinTree.BinTree
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.Maybe.map

-- Applies a function to a single element in the BinMap.
-- - m: The BinMap to modify.
-- - k: The Bits key of the element to modify.
-- - f: The function to apply to the element.
-- = A new BinMap with the function applied to the specified element (if it exists).
mut : ∀ {A : Set} → BinMap A → Bits → (A → A) → BinMap A
mut (Node val l r) E     f = Node (map f val) l r
mut (Node val l r) (O k) f = Node val (mut l k f) r
mut (Node val l r) (I k) f = Node val l (mut r k f)
mut Leaf           _     _ = Leaf
