module HVM.Net.Net where

open import Base.List.List
open import HVM.Redex.Redex
open import HVM.Term.Term

record Net : Set where
  constructor MkNet
  field
    root : Term
    rbag : List Redex

