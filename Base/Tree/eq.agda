module Base.Tree.eq where

open import Base.Tree.Type
open import Base.Bool.Type
open import Base.Bool.and
open import Base.Bool.not
open import Base.Trait.Eq public

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
