module Base.Map.show where

open import Base.Map.Type
open import Base.Maybe.Type
open import Base.Tree.Type
open import Base.String.Type
open import Base.String.append

show : ∀ {A : Set} → (A → String) → Map A → String
show f Leaf                  = "_"
show f (Node None     lft rgt) = "#[" ++ show f lft ++ " " ++ show f rgt ++ "]"
show f (Node (Some v) lft rgt) = "#" ++ f v ++ "[" ++ show f lft ++ " " ++ show f rgt ++ "]"
