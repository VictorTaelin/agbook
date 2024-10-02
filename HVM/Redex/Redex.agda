module HVM.Redex.Redex where

open import HVM.Mode.Mode
open import HVM.Term.Term

record Redex (mode : Mode) : Set where
  constructor MkRedex
  field
    lft : Term mode
    rgt : Term mode
