module Base.AVLTree.Balance.Trait.Eq where

open import Base.AVLTree.Balance.Balance
import Base.AVLTree.Balance.eq as Balance
import Base.AVLTree.Balance.neq as Balance
import Base.Trait.Eq as Eq

instance
  EqBalance : Eq.Eq Balance
  EqBalance = Eq.make-eq Balance.eq Balance.neq
