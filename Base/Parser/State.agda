module Base.Parser.State where

open import Base.Nat.Type
open import Base.String.Type

-- Represents the state of a parser.
record State : Set where
  constructor MkState
  field
    input : String -- The remaining input text to be consumed.
    index : Nat    -- The current parsing index.

-- Creates a new State with the given input and initial index of zero.
new-parser-state : String -> State
new-parser-state input = MkState input Zero
