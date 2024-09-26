module Base.Trait.Add where

open import Agda.Primitive

-- Represents the Add trait for a type A
record Add {a} (A : Set a) : Set (lsuc a) where
  constructor make-add
  field
    add : A -> A -> A

open Add {{...}} public

-- Infix operator for addition
infixl 6 _+_

_+_ : ∀ {a} {A : Set a} {{addA : Add A}} -> A -> A -> A
_+_ {{addA}} = add {{addA}}