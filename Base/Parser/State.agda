module Base.Parser.State where

open import Base.Nat.Nat
open import Base.String.String

-- Represents the state of a parser.
-- - input: The remaining input text to be consumed.
-- - index: The current parsing index.
-- = A record containing the current state of parsing.
record State : Set where
  constructor MkState
  field
    input : String
    index : Nat

-- Creates a new State with the given input and initial index of zero.
-- - 1st: The input string to be parsed.
-- = A new State with the given input and index set to zero.
new-parser-state : String -> State
new-parser-state input = MkState input Zero