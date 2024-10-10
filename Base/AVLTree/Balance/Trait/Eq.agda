module Base.AVLTree.Balance.Trait.Eq where

open import Base.AVLTree.Balance.Balance
import Base.AVLTree.Balance.eq as Balance
import Base.AVLTree.Balance.neq as Balance
open import Base.Trait.Eq

instance
  EqBalance : Eq Balance
  EqBalance = MkEq Balance.eq Balance.neq

