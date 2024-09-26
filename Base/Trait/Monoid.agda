module Base.Trait.Monoid where

open import Base.List.List

record Monoid (A : Set) : Set where
  field
    memp : A
    mapp : A -> A -> A

open Monoid {{...}} public

infixr 6 _<>_

_<>_ : ∀ {A : Set} {{monoidA : Monoid A}} -> A -> A -> A
_<>_ {{monoidA}} = mapp {{monoidA}}

concat : ∀ {A : Set} {{monoidA : Monoid A}} -> List A -> A
concat [] = memp
concat (x :: xs) = x <> concat xs
