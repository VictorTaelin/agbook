module Base.Parser.Type where

open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Result.Type

-- Represents a parser as a function from State to Result.
-- - A: The type of the value to be parsed.
-- A parser takes a State and returns a Result which is either:
-- - Done: a Reply containing the parsed value and new state.
-- - Fail: an Error containing the index and message.
Parser : Set → Set
Parser A = State → Result (Reply A) Error
