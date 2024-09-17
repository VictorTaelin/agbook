module Data.AVLTree.Balance.eq where

open import Data.AVLTree.Balance.Type
open import Data.Trait.Eq public
open import Data.Trait.Eq.default-eq
open import Data.Bool.Type

instance
  EqBalance : Eq Balance
  EqBalance = default-eq eq-bal where
    eq-bal : Balance → Balance → Bool
    eq-bal -one -one = True
    eq-bal zero zero = True
    eq-bal +one +one = True
    eq-bal _    _    = False
