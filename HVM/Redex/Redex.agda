module HVM.Redex.Redex where

open import HVM.Term.Term

record Redex : Set where
  constructor MkRedex
  field
    lft : Term
    rgt : Term
