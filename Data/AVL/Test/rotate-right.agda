module Data.AVL.Test.rotate-right where

open import Data.AVL.Type
open import Data.AVL.Balance.Type
open import Data.AVL.Balance.rotate-right
open import Data.AVL.empty
open import Data.Equal.Type
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Pair.Type
open import Data.Bool.Type

-- Test case 1: Rotate right with left child having -one balance
test-rotate-right-1 : 
  rotate-right (Node 2 -one 
                  (Node 1 -one 
                    empty 
                    empty)
                  empty) 
  ===
  (Node 1 zero 
    empty
    (Node 2 zero 
      empty 
      empty) , False)
test-rotate-right-1 = refl

-- Test case 2: Rotate right with left child having zero balance
test-rotate-right-2 : 
  rotate-right (Node 2 -one 
                  (Node 1 zero 
                    empty 
                    empty)
                  empty) 
  ===
  (Node 1 +one 
    empty
    (Node 2 -one 
      empty 
      empty) , True)
test-rotate-right-2 = refl

-- Test case 3: Rotate right with left child having +one balance
test-rotate-right-3 : 
  rotate-right (Node 3 -one 
                  (Node 1 +one 
                    empty 
                    (Node 2 zero 
                      empty 
                      empty))
                  empty) 
  ===
  (Node 2 zero 
    (Node 1 zero 
      empty 
      empty)
    (Node 3 zero 
      empty 
      empty) , False)
test-rotate-right-3 = refl

-- Test case 4: Invalid rotation (should return the same tree)
test-rotate-right-4 : 
  rotate-right (Node 1 zero 
                  empty 
                  empty) 
  ===
  (Node 1 zero 
    empty 
    empty , False)
test-rotate-right-4 = refl