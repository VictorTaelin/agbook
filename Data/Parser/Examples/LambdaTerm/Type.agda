{-# OPTIONS --no-termination-check #-}

module Data.Parser.Examples.LambdaTerm.Type where

open import Data.String.Type

data Term : Set where
  Lam : String → Term → Term
  App : Term → Term → Term
  Var : String → Term
