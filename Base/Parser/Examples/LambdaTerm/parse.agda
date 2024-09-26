{-# OPTIONS --no-termination-check #-}

module Base.Parser.Examples.LambdaTerm.parse where

open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Parser.Examples.LambdaTerm.LambdaTerm
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.State
open import Base.Parser.Parser
open import Base.Parser.consume
open import Base.Parser.parse-name
open import Base.Parser.peek-one
open import Base.Parser.skip-trivia
open import Base.String.String

parse : Parser Term
parse = do
  skip-trivia
  one <- peek-one
  case one of λ where
    (Some 'λ') -> do
      consume "λ"
      name <- parse-name
      body <- parse
      pure (Lam name body)
    (Some '(') -> do
      consume "("
      func <- parse
      argm <- parse
      consume ")"
      pure (App func argm)
    _ -> do
      name <- parse-name
      pure (Var name)
