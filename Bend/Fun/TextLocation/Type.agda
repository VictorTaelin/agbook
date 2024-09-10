module Bend.Fun.TextLocation.Type where

open import Data.Nat.Type

record TextLocation : Set where
  constructor MkTextLocation
  field
    line : Nat
    char : Nat