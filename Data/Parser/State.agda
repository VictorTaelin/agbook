module Data.Parser.State where

open import Data.Nat.Type
open import Data.String.Type

-- Represents the state of a parser.
record State : Set where
  constructor MkState
  field
    input : String -- The remaining input text to be consumed.
    index : Nat    -- The current parsing index.

-- Creates a new State with the given input and initial index of zero.
new_parser_state : String → State
new_parser_state input = MkState input Zero
