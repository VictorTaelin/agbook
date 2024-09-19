module Base.OrdMap.fold where

open import Base.OrdMap.Type
open import Base.AVL.fold

-- Re-export the fold function from AVL
open Base.AVL.fold public using (fold)
