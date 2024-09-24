module Base.Trait.Add where

open import Agda.Primitive

-- Represents the Add trait for a type A
record Add {a} (A : Set a) : Set (lsuc a) where
  field
    add : A -> A -> A

open Add {{...}} public

-- Helper function to create an Add instance
make-add : ∀ {a} {A : Set a} -> (A -> A -> A) -> Add A
make-add add-impl = record
  { add = add-impl
  }

-- Infix operator for addition
infixl 6 _+_

_+_ : ∀ {a} {A : Set a} {{addA : Add A}} -> A -> A -> A
_+_ {{addA}} = add {{addA}}