module HVM2.Term.Type where

open import Base.Bits.Type
open import Base.Nat.Type

data Term : Set where
  Var : (nm : Bits) -> Term
  Era : Term
  Con : (p1 : Term) -> (p2 : Term) -> Term
  Dup : (p1 : Term) -> (p2 : Term) -> Term
