module Bend.Parser.sep-by where

open import Base.List.reverse
open import Base.String.Type
open import Base.List.Type
open import Base.Unit.Type
open import Base.Nat.Type
open import Base.Parser.Type
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.alternative
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
