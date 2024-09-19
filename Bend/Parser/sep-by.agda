module Bend.Parser.sep-by where

open import Data.List.reverse
open import Data.String.Type
open import Data.List.Type
open import Data.Unit.Type
open import Data.Nat.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Parser.alternative
open import Bend.Parser.skip-trivia
open import Bend.Parser.consume
open import Bend.Parser.try-consume

{-# TERMINATING #-}
-- Parses a list of elements separated by a specified separator.
-- Accepts an optional trailing separator.
-- - el: Parser for the elements.
-- - sep: String separator.
-- - min-els: Minimum number of elements required.
-- = A parser that produces a list of parsed elements.
sep-by : ∀ {A : Set} → Parser A → String → Nat → Parser (List A)
sep-by el sep min-els = do
  els ← go el sep min-els []
  pure (reverse els)

  where

  go : ∀ {A : Set} → Parser A → String → Nat → List A → Parser (List A)

  go el sep (Succ (Succ n)) acc = do
    skip-trivia
    val ← el
    consume sep
    go el sep (Succ n) (val :: acc)

  go el sep (Succ Zero) acc = do
    skip-trivia
    val ← el
    rest ← ((consume sep     >> go el sep Zero (val :: acc))
        <|> (try-consume sep >> pure (val :: acc)))
    pure rest

  go el sep Zero acc = do
    skip-trivia
    let el = do
      val ← el
      rest ← ((consume sep     >> go el sep Zero (val :: acc))
          <|> (try-consume sep >> pure (val :: acc)))
      pure rest
    el <|> pure acc
