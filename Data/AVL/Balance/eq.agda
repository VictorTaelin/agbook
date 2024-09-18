module Data.AVL.Balance.eq where

open import Data.AVL.Balance.Type
open import Data.Trait.Eq public
open import Data.Trait.Eq.default-eq
open import Data.Bool.Type

instance
  EqBalance : Eq Balance
  EqBalance = default-eq λ where
    -one -one → True
    zero zero → True
    +one +one → True
    _    _    → False
