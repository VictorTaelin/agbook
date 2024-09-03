module HVM.Net.Type where

open import Data.List.Type
open import HVM.Redex.Type
open import HVM.Term.Type

-- Represents a Net, which consists of a redex bag (rbag) and a root term
record Net : Set where
  constructor MkNet
  field
    rbag : List Redex
    root : Term
