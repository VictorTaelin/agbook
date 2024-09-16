{-# OPTIONS --no-termination-check #-}

module Data.Parser.Examples.LambdaTerm.parse where

open import Data.Parser.Examples.LambdaTerm.Type
open import Data.String.Type
open import Data.Maybe.Type
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.skip-trivia
open import Data.Parser.consume
open import Data.Parser.peek-one
open import Data.Parser.parse-name
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Function.case

parse : Parser Term
parse = do
  skip-trivia
  one ← peek-one
  case one of λ where
    (Some 'λ') → do
      consume "λ"
      name ← parse-name
      body ← parse
      pure (Lam name body)
    (Some '(') → do
      consume "("
      func ← parse
      argm ← parse
      consume ")"
      pure (App func argm)
    _ → do
      name ← parse-name
      pure (Var name)
