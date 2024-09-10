module Data.Tree.eq where

open import Data.Tree.Type
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Equal.Type
open import Data.Class.Eq
open import Data.Bool.and
open import Data.Bool.not


instance
  EqTree : ∀ {A : Set} {{EqA : Eq A}} → Eq (Tree A)
  EqTree {{EqA}} = record
    { _≡_ = eq-tree
    ; _≠_ = neq-tree
    }
    where
      eq-tree : Tree _ → Tree _ → Bool
      eq-tree Leaf Leaf = True
      eq-tree (Node x1 l1 r1) (Node x2 l2 r2) = 
        _≡_ {{EqA}} x1 x2 && (eq-tree l1 l2 && eq-tree r1 r2)
      eq-tree _ _ = False
      
      neq-tree : Tree _ → Tree _ → Bool
      neq-tree t1 t2 = not (eq-tree t1 t2)

-- Testes
_ : (Node 1 Leaf Leaf == Node 1 Leaf Leaf) === True
_ = refl

_ : (Node 1 (Node 2 Leaf Leaf) Leaf == Node 1 (Node 2 Leaf Leaf) Leaf) === True
_ = refl

_ : (Node 1 Leaf Leaf == Node 2 Leaf Leaf) === False
_ = refl

_ : (Leaf == Node 1 Leaf Leaf) === False
_ = refl
