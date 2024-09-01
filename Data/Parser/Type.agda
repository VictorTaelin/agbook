module Data.Parser.Type where

open import Data.Parser.Error
open import Data.Parser.Reply
open import Data.Parser.State
open import Data.Result.Type

-- Represents a parser as a function from State to Result.
-- - A: The type of the value to be parsed.
-- A parser takes a State and returns a Result which is either:
-- - Done: a Reply containing the parsed value and new state.
-- - Fail: an Error containing the index and message.
Parser : Set → Set
Parser A = State → Result (Reply A) Error
