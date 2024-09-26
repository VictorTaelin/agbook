module HVM2.Term.Term where

open import Base.String.String

data Term : Set where
  Var : (nm : String) -> Term
  Era : Term
  Con : (p1 : Term) -> (p2 : Term) -> Term
  Dup : (p1 : Term) -> (p2 : Term) -> Term
