module Data.Pair.Type where

-- Represents a pair of values as a record.
record Pair (A B : Set) : Set where
  constructor _,_
  field
    fst : A
    snd : B

infixr 4 _,_
