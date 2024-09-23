module Base.OrdMap.fold where

open import Base.OrdMap.Type
open import Base.TreeAVL.fold

-- Re-export the fold function from AVL
open Base.TreeAVL.fold public using (fold)
