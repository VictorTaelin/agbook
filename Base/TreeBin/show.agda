module Base.TreeBin.show where

import Base.Trait.Show as Show
open import Base.String.append
open import Base.String.Type
open import Base.TreeBin.Type

show : ∀ {A : Set} → {{ShowA : Show.Show A}} → TreeBin A → String
show Leaf         = "_"
show (Node x l r) = "{" ++ Show.to-string x ++ ", " ++ show l ++ ", " ++ show r ++ "}"
