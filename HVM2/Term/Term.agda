module HVM2.Term.Term where

open import Base.String.String

data Term : Set where
  Var : (nm : String) → Term
  Era : Term
  Con : forall (p1 p2 : Term) → Term
  Dup : forall (p1 p2 : Term) → Term
