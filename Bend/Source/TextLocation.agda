module Bend.Source.TextLocation where

open import Base.Nat.Nat

-- A location in a text file
record TextLocation : Set where
  constructor MkTextLocation
  field
    line : Nat  -- The line number
    char : Nat  -- The character position within the line
