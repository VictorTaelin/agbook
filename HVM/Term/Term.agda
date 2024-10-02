module HVM.Term.Term where

open import Base.String.String
open import Base.Bool.if
open import HVM.Mode.Mode
open import HVM.Mode.is-wired
open import HVM.Addr.Addr

data Term (mode : Mode) : Set where
  Var : (if is-wired mode then Addr else String) → Term mode
  Era : Term mode
  Con : (p1 p2 : Term mode) → Term mode
  Dup : (p1 p2 : Term mode) → Term mode
