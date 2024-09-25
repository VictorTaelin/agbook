module HVM2.Term.Type where

open import Base.String.Type

data Term : Set where
  Var : (nm : String) -> Term
  Era : Term
  Con : (p1 : Term) -> (p2 : Term) -> Term
  Dup : (p1 : Term) -> (p2 : Term) -> Term
