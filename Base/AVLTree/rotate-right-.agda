module Base.AVLTree.rotate-right- where

open import Base.AVLTree.AVLTree
open import Base.AVLTree.Balance.Balance
open import Base.AVLTree.Balance.rotate-right
open import Base.AVLTree.empty
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Pair.Pair
open import Base.Bool.Bool
open import Base.Unit.Unit

-- Test case 1: Rotate right with left child having -one balance
test-rotate-right-1 : 
  rotate-right (Node (2 , unit) -one 
                  (Node (1 , unit) -one 
                    empty 
                    empty)
                  empty) 
  ≡
  (Node (1 , unit) zero 
    empty
    (Node (2 , unit) zero 
      empty 
      empty) , False)
test-rotate-right-1 = refl

-- Test case 2: Rotate right with left child having zero balance
test-rotate-right-2 : 
  rotate-right (Node (2 , unit) -one 
                  (Node (1 , unit) zero 
                    empty 
                    empty)
                  empty) 
  ≡
  (Node (1 , unit) +one 
    empty
    (Node (2 , unit) -one 
      empty 
      empty) , True)
test-rotate-right-2 = refl

-- Test case 3: Rotate right with left child having +one balance
test-rotate-right-3 : 
  rotate-right (Node (3 , unit) -one 
                  (Node (1 , unit) +one 
                    empty 
                    (Node (2 , unit) zero 
                      empty 
                      empty))
                  empty) 
  ≡
  (Node (2 , unit) zero 
    (Node (1 , unit) zero 
      empty 
      empty)
    (Node (3 , unit) zero 
      empty 
      empty) , False)
test-rotate-right-3 = refl

-- Test case 4: Invalid rotation (should return the same tree)
test-rotate-right-4 : 
  rotate-right (Node (1 , unit) zero 
                  empty 
                  empty) 
  ≡
  (Node (1 , unit) zero 
    empty 
    empty , False)
test-rotate-right-4 = refl

