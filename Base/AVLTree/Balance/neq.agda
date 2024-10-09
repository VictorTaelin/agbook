module Base.AVLTree.Balance.neq where

open import Base.AVLTree.Balance.Balance
open import Base.Bool.Bool


-- Equality for Balance values.
-- - 1st: The Balance value.
-- - 2nd: The Balance value.
-- = True if first and second are the same Balance value, False otherwise.
neq : Balance → Balance → Bool
neq -one -one = False
neq zero zero = False
neq +one +one = False
neq _    _    = True

