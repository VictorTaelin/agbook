module Base.AVLTree.Balance.eq where

open import Base.AVLTree.Balance.Balance
open import Base.Bool.Bool


-- Equality for Balance values.
-- - x: The 1st Balance value.
-- - y: The 2nd Balance value.
-- = True if x and y are the same Balance value, False otherwise.
eq : Balance → Balance → Bool
eq -one -one = True
eq zero zero = True
eq +one +one = True
eq _    _    = False

