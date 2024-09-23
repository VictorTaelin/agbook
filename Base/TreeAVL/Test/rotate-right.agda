module Base.TreeAVL.Test.rotate-right where

open import Base.TreeAVL.Type
open import Base.TreeAVL.Balance.Type
open import Base.TreeAVL.Balance.rotate-right
open import Base.TreeAVL.empty
open import Base.Equal.Type
open import Base.Nat.Type
open import Base.Nat.eq
open import Base.Pair.Type
open import Base.Bool.Type
open import Base.Unit.Type

-- Test case 1: Rotate right with left child having -one balance
test-rotate-right-1 : 
  rotate-right (Node (2 , unit) -one 
                  (Node (1 , unit) -one 
                    empty 
                    empty)
                  empty) 
  ===
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
  ===
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
  ===
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
  ===
  (Node (1 , unit) zero 
    empty 
    empty , False)
test-rotate-right-4 = refl