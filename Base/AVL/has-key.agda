module Base.AVL.has-key where

open import Base.AVL.Type
open import Base.Bool.Type
open import Base.Ord.Trait
open import Base.Ordering.Type
open import Base.Pair.Type

-- Checks if a key exists in the AVL tree.
-- - key: The key to search for.
-- - tree: The AVL tree to search in.
-- = True if the key is found, False otherwise.
has-key : ∀ {K V : Set} → {{_ : Ord K}} → K → AVL K V → Bool
has-key _   Leaf = False
has-key key (Node (curr-key , _) _ left right) with compare key curr-key
... | LT = has-key key left
... | EQ = True
... | GT = has-key key right
