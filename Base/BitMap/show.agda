module Base.BitMap.show where

open import Base.BitMap.BitMap
open import Base.Maybe.Maybe
open import Base.String.String
open import Base.String.append
open import Base.BinTree.BinTree

show : ∀ {A : Set} → (A → String) → BitMap A → String
show f Leaf                = "_"
show f (Node None     l r) = "#[" ++ show f l ++ " " ++ show f r ++ "]"
show f (Node (Some v) l r) = "#" ++ f v ++ "[" ++ show f l ++ " " ++ show f r ++ "]"
