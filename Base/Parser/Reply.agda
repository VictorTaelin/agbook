module Base.Parser.Reply where

open import Base.Parser.State

-- Represents the reply of a parser.
-- - 1st: The type of the parsed value.
-- = A record containing the current parser state and the parsed value.
record Reply (A : Set) : Set where
  constructor MkReply
  field
    state : State
    value : A

