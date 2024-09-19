module Base.AVL.Balance.eq where

open import Base.AVL.Balance.Type
open import Base.Eq.Trait public
open import Base.Eq.default-eq
open import Base.Bool.Type

instance
  EqBalance : Eq Balance
  EqBalance = default-eq λ where
    -one -one → True
    zero zero → True
    +one +one → True
    _    _    → False
