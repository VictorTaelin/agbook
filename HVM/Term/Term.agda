module HVM.Term.Term where

open import Base.String.String
open import HVM.Addr.Addr

data Term : Set where
  Var : (name : String) → (targ : Addr) → Term
  Era : Term
  Con : (p1 p2 : Term) → Term
  Dup : (p1 p2 : Term) → Term
