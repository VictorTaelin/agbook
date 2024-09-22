module Base.Trait.Add where

open import Agda.Primitive

record Add {a} (A : Set a) : Set (lsuc a) where
  field
    add : A → A → A

open Add {{...}} public

infixl 6 _+_

_+_ : ∀ {a} {A : Set a} {{addA : Add A}} → A → A → A
_+_ {{addA}} = add {{addA}}

make-add : ∀ {a} {A : Set a} → (A → A → A) → Add A
make-add add-impl = record
  { add = add-impl
  }
