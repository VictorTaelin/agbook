module Base.BitMap.show where

open import Base.BitMap.Type
open import Base.Maybe.Type
open import Base.String.Type
open import Base.String.append
open import Base.TreeBin.Type

show : ∀ {A : Set} -> (A -> String) -> BitMap A -> String
show f Leaf                    = "_"
show f (Node None     lft rgt) = "#[" ++ show f lft ++ " " ++ show f rgt ++ "]"
show f (Node (Some v) lft rgt) = "#" ++ f v ++ "[" ++ show f lft ++ " " ++ show f rgt ++ "]"
