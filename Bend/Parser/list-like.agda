module Bend.Parser.list-like where

open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Parser.alternative
open import Bend.Parser.consume
open import Bend.Parser.try-consume
open import Bend.Parser.skip-trivia
open import Data.Bool.Type
open import Data.Bool.if
open import Data.List.Type
open import Data.List.reverse
open import Data.Maybe.Type
open import Data.Unit.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Function.case

{-# TERMINATING #-}
-- Parses a list-like structure with possibly trailing separators.
-- Skips trivia between elements.
-- - parser: Function to parse a single element.
-- - start: String that marks the start of the list.
-- - end: String that marks the end of the list.
-- - sep: String used as separator between elements.
-- - hard-sep: If the separator is mandatory or optional
-- - min-els: Minimum number of elements required.
-- Returns a list of parsed elements.
list-like : ∀ {A : Set} → Parser A → String → String → String → Bool → Nat → Parser (List A)
list-like p start end sep hard-sep min-els = do
  consume start
  skip-trivia
  elements ← if hard-sep then
                parse-hard p end sep [] min-els
              else
                parse-soft p end sep [] min-els
  pure (reverse elements)

  where

  -- Parse elements with optional separators
  parse-soft : {A : Set} → Parser A → String → String → List A → Nat → Parser (List A)
  parse-soft p end sep acc 0 = do
    (consume end >> pure acc) <|> (do
      element ← p
      try-consume sep
      parse-soft p end sep (element :: acc) 0)
  parse-soft p end sep acc (Succ n) = do
    element ← p
    (try-consume sep)
    parse-soft p end sep (element :: acc) n

  -- Parse elements with mandatory separators
  parse-hard : {A : Set} → Parser A → String → String → List A → Nat → Parser (List A)
  parse-hard p end sep acc (Succ (Succ n)) = do
    element ← p
    skip-trivia
    consume sep
    parse-hard p end sep (element :: acc) (Succ n)

  -- One or zero mandatory elements, we allow a trailing separator
  parse-hard p end sep acc 1 = do
    element ← p
    skip-trivia
    is-sep ← try-consume sep
    if is-sep then
        parse-hard p end sep (element :: acc) 0
      else do
        consume end
        pure (element :: acc)

  parse-hard p end sep acc 0 = do
    (consume end >> pure acc) <|> (do
      element ← p
      skip-trivia
      is-sep ← try-consume sep
      if is-sep then
          parse-hard p end sep (element :: acc) 0
        else do
          consume end
          pure (element :: acc))
