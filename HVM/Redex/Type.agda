module HVM.Redex.Type where

open import HVM.Term.Type

-- Defines a Redex as a record with two Terms: lft and rgt
record Redex : Set where
  constructor MkRedex
  field
    lft : Term
    rgt : Term
