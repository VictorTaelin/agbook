module Base.OrdMap.fold where

open import Base.OrdMap.Type
open import Base.AVLTree.fold

-- Re-export the fold function from AVL
open Base.AVLTree.fold public using (fold)
