module Base.AVLTree.rotate-left- where

open import Base.AVLTree.Balance.Balance
open import Base.AVLTree.Balance.rotate-left
open import Base.AVLTree.AVLTree
open import Base.AVLTree.empty
open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Pair.Pair
open import Base.Unit.Unit

-- Test case 1: Rotate left with right child having +one balance
test-rotate-left-1 : 
  rotate-left (Node (1 , unit) +one 
                 empty 
                 (Node (2 , unit) +one 
                   empty 
                   empty)) 
  ≡
  (Node (2 , unit) zero 
    (Node (1 , unit) zero 
      empty 
      empty) 
    empty , False)
test-rotate-left-1 = refl

-- Test case 2: Rotate left with right child having zero balance
test-rotate-left-2 : 
  rotate-left (Node (1 , unit) +one 
                 empty 
                 (Node (2 , unit) zero 
                   empty 
                   empty)) 
  ≡
  (Node (2 , unit) -one 
    (Node (1 , unit) +one 
      empty 
      empty) 
    empty , True)
test-rotate-left-2 = refl

-- Test case 3: Rotate left with right child having -one balance
test-rotate-left-3 : 
  rotate-left (Node (1 , unit) +one 
                 empty 
                 (Node (3 , unit) -one 
                   (Node (2 , unit) zero 
                     empty 
                     empty) 
                   empty)) 
  ≡
  (Node (2 , unit) zero 
    (Node (1 , unit) zero 
      empty 
      empty) 
    (Node (3 , unit) zero 
      empty 
      empty) , False)
test-rotate-left-3 = refl

-- Test case 4: Invalid rotation (should return the same tree)
test-rotate-left-4 : 
  rotate-left (Node (1 , unit) zero 
                 empty 
                 empty) 
  ≡
  (Node (1 , unit) zero 
    empty 
    empty , False)
test-rotate-left-4 = refl

