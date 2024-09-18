module Bend.Source.TextLocation.Type where

open import Base.Nat.Type

-- A location in a text file
record TextLocation : Set where
  constructor MkTextLocation
  field
    line : Nat  -- The line number
    char : Nat  -- The character position within the line
