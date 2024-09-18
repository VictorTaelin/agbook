{-# OPTIONS --no-termination-check #-}

module Base.Parser.Examples.LambdaTerm.Type where

open import Base.String.Type

data Term : Set where
  Lam : String → Term → Term
  App : Term → Term → Term
  Var : String → Term
