module HVM2.Net.Net where

open import Base.List.List
open import HVM2.Redex.Redex
open import HVM2.Term.Term

-- Represents a Net, which consists of a redex bag (rbag) and a root term
record Net : Set where
  constructor MkNet
  field
    rbag : List Redex
    root : Term
