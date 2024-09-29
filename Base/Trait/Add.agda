module Base.Trait.Add where

open import Agda.Primitive

-- Represents the Add trait for a type A
record Add {a} (A : Set a) : Set (lsuc a) where
  constructor MkAdd
  field
    add : A → A → A

  _+_ = add

  infixl 6 _+_

open Add {{...}} public
