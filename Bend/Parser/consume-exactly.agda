module Bend.Parser.consume-exactly where

open import Base.Parser.Parser
open import Base.Parser.consume
open import Base.String.String
open import Base.Unit.Unit

-- Consumes exactly the given string from the input.
-- - target: The string to be consumed from the input.
-- = A Parser that returns Unit if successful, or fails if the target
--   string is not found at the current position.
consume-exactly : String → Parser Unit
consume-exactly = consume

