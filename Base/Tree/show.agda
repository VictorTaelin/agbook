module Base.Tree.show where

open import Base.Tree.Type
open import Base.String.Type
open import Base.String.append
import Base.Trait.Show as Show

show : ∀ {A : Set} → {{ShowA : Show.Show A}} → Tree A → String
show Leaf         = "_"
show (Node x l r) = "{" ++ Show.to-string x ++ ", " ++ show l ++ ", " ++ show r ++ "}"
