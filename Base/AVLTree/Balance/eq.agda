module Base.AVLTree.Balance.eq where

open import Base.AVLTree.Balance.Balance
open import Base.Bool.Bool
open import Base.Trait.Eq public
open import Base.Trait.Eq public

-- Equality for Balance values.
-- - x: The 1st Balance value.
-- - y: The 2nd Balance value.
-- = True if x and y are the same Balance value, False otherwise.
instance
  EqBalance : Eq Balance
  EqBalance = make-eq λ where
    -one -one -> True
    zero zero -> True
    +one +one -> True
    _    _    -> False
