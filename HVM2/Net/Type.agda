module HVM2.Net.Type where

open import Base.List.Type
open import HVM2.Redex.Type
open import HVM2.Term.Type

-- Represents a Net, which consists of a redex bag (rbag) and a root term
record Net : Set where
  constructor MkNet
  field
    rbag : List Redex
    root : Term
