module Base.Show.Trait where

open import Agda.Primitive
open import Base.String.Type

record Show {a} (A : Set a) : Set (lsuc a) where
  field
    to-string  : A → String

show : ∀ {a} {A : Set a} {{showA : Show A}} → A → String
show {{showA}} x = Show.to-string showA x
