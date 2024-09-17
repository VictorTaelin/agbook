module Data.AVLTree.Balance.Type where

data Balance : Set where
  -one : Balance
  zero : Balance
  +one : Balance
