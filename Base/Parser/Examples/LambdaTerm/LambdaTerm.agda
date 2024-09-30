module Base.Parser.Examples.LambdaTerm.LambdaTerm where

open import Base.String.String

data Term : Set where
  Lam : String → Term → Term
  App : Term → Term → Term
  Var : String → Term
