module Pair.Main where

-- Represents a pair of values.
-- - _,_ : constructs a pair from two values of possibly different types.
data Pair (A B : Set) : Set where
  _,_ : A → B → Pair A B

infixr 4 _,_
