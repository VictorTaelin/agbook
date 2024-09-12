module Data.Tree.eq where

open import Data.Tree.Type
open import Data.Bool.Type
open import Data.Trait.Eq
open import Data.Bool.and
open import Data.Bool.not


instance
  EqTree : ∀ {A : Set} {{EqA : Eq A}} → Eq (Tree A)
  EqTree {{EqA}} = record
    { eq = eq-tree
    ; neq = neq-tree
    }
    where
      eq-tree : Tree _ → Tree _ → Bool
      eq-tree Leaf Leaf = True
      eq-tree (Node x1 l1 r1) (Node x2 l2 r2) = 
        eq {{EqA}} x1 x2 && (eq-tree l1 l2 && eq-tree r1 r2)
      eq-tree _ _ = False
      
      neq-tree : Tree _ → Tree _ → Bool
      neq-tree t1 t2 = not (eq-tree t1 t2)
