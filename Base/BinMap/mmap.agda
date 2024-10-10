module Base.BinMap.mmap where

open import Base.BinMap.BinMap
open import Base.Trait.Monad
import Base.BinTree.mmap as BinTree
import Base.Maybe.mmap as Maybe

-- Applies a function to each value in the BinMap.
-- - f: The function to be applied to each value.
-- - bm: The BinMap to map over.
-- = A new BinMap with the function applied to all values.
mmap : ∀ {M : Set → Set} {{monadM : Monad M}} {A B : Set}
       → (A → M B) → BinMap A → M (BinMap B)
mmap f m = BinTree.mmap (Maybe.mmap f) m
