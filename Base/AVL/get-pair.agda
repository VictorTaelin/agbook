module Base.AVL.get-pair where

open import Base.AVL.Type
open import Base.Maybe.Type
open import Base.Ord.Trait
open import Base.Ordering.Type
open import Base.Pair.Type

-- Retrieves a key-value pair from the AVL tree based on the given key.
-- - key: The key to search for.
-- - tree: The AVL tree to search in.
-- = Some key-value pair if the key is found, None otherwise.
get-pair : ∀ {K V : Set} → {{_ : Ord K}} → K → AVL K V → Maybe (Pair K V)
get-pair _   Leaf = None
get-pair key (Node (curr-key , curr-val) _ left right) with compare key curr-key
... | LT = get-pair key left
... | EQ = Some (curr-key , curr-val)
... | GT = get-pair key right
