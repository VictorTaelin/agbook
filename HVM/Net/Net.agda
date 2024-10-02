module HVM.Net.Net where

open import Base.List.List
open import HVM.Mode.Mode
open import HVM.Redex.Redex
open import HVM.Term.Term

record Net (mode : Mode) : Set where
  constructor MkNet
  field
    root : Term mode
    rbag : List (Redex mode)
