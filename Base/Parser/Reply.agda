module Base.Parser.Reply where

open import Base.Parser.State

-- Represents the reply of a parser.
-- - A: The type of the parsed value.
record Reply (A : Set) : Set where
  constructor MkReply
  field
    state : State -- The current state of the parser after parsing.
    value : A     -- The parsed value.
