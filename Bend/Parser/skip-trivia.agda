{-# OPTIONS --no-termination-check #-}

module Bend.Parser.skip-trivia where

open import Data.Function.case
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Char.Type
open import Data.Char.is-space
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Nat.add
open import Data.Nat.sub
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Parser.starts-with
open import Data.Parser.peek-one
open import Data.Parser.advance-many
open import Data.Parser.advance-one
open import Data.Parser.take-while
open import Data.Unit.Type
open import Data.String.Type
open import Data.String.eq
open import Data.Char.eq

-- Skips a single-line comment
skip-single-line-comment : Parser Unit
skip-single-line-comment = do
  is-comment ← starts-with "#"
  if is-comment
    then (do
      advance-one
      take-while (λ c → c != '\n')
      advance-one
      pure unit)
    else (pure unit)

-- Skips a multi-line comment
skip-multi-line-comment : Nat → Parser Unit
skip-multi-line-comment depth = do
  is-comment ← starts-with "#{"
  if is-comment
    then (do
      advance-many 2
      skip-to-comment-end (depth + 1))
    else pure unit
  where

  skip-to-comment-end : Nat → Parser Unit
  skip-to-comment-end 0 = pure unit
  skip-to-comment-end d = do
    is-start ← starts-with "#{"
    is-end   ← starts-with "#}"
    let res = if is-start
              then skip-multi-line-comment d
              else if is-end
              then (do
                advance-many 2
                skip-to-comment-end (d - 1))
              else (do
                advance-one
                skip-to-comment-end d)
    res

-- Skips all trivia (whitespace and comments)
skip-trivia : Parser Unit
skip-trivia = do
  c ← peek-one
  case c of λ where
    (Some c) → 
      if is-space c then (do
        advance-one
        skip-trivia)
      else if c == '#' then (do
        skip-multi-line-comment 0
        skip-single-line-comment
        skip-trivia)
      else pure unit
    None → pure unit
