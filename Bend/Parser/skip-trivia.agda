{-# OPTIONS --no-termination-check #-}

module Bend.Parser.skip-trivia where

open import Base.Function.case
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Char.Type
open import Base.Char.is-space
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Nat.sub
open import Base.Parser.Type
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.starts-with
open import Base.Parser.peek-one
open import Base.Parser.advance-many
open import Base.Parser.advance-one
open import Base.Parser.take-while
open import Base.Unit.Type
open import Base.String.Type
open import Base.String.Trait.Eq
open import Base.Char.Trait.Eq
open import Base.Trait.Eq

-- Skips a single-line comment
skip-single-line-comment : Parser Unit
skip-single-line-comment = do
  is-comment <- starts-with "#"
  if is-comment
    then (do
      advance-one
      take-while (λ c -> c != '\n')
      advance-one
      pure unit)
    else (pure unit)

-- Skips a multi-line comment
skip-multi-line-comment : Nat -> Parser Unit
skip-multi-line-comment depth = do
  is-comment <- starts-with "#{"
  if is-comment
    then (do
      advance-many 2
      skip-to-comment-end (depth + 1))
    else pure unit
  where

  skip-to-comment-end : Nat -> Parser Unit
  skip-to-comment-end 0 = pure unit
  skip-to-comment-end d = do
    is-start <- starts-with "#{"
    is-end   <- starts-with "#}"
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
  c <- peek-one
  case c of λ where
    (Some c) ->
      if is-space c then (do
        advance-one
        skip-trivia)
      else if c == '#' then (do
        skip-multi-line-comment 0
        skip-single-line-comment
        skip-trivia)
      else pure unit
    None -> pure unit
