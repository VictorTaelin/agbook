module Base.BinTree.show where

import Base.Trait.Show as Show
open import Base.BinTree.Type
open import Base.String.Type
open import Base.String.append

show : ∀ {A : Set} -> {{ShowA : Show.Show A}} -> BinTree A -> String
show Leaf         = "_"
show (Node x l r) = "{" ++ Show.to-string x ++ ", " ++ show l ++ ", " ++ show r ++ "}"
