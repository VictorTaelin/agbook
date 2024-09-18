module Base.AVL.has-key where

open import Base.AVL.Type
open import Base.Bool.Type
open import Base.Trait.Ord
open import Base.Ordering.Type

-- Checks if a key exists in the AVL tree.
-- - key: The key to search for.
-- - tree: The AVL tree to search in.
-- = True if the key is found, False otherwise.
has-key : ∀ {A : Set} → {{OrdA : Ord A}} → A → AVL A → Bool
has-key _ Leaf = False
has-key key (Node value _ left right) with compare key value
... | LT = has-key key left
... | EQ = True
... | GT = has-key key right
