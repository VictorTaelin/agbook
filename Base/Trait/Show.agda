module Base.Trait.Show where

open import Agda.Primitive
open import Base.String.Type

record Show {a} (A : Set a) : Set (lsuc a) where
  field to-string : A -> String

open Show {{...}} public

show : ∀ {a} {A : Set a} {{showA : Show A}} -> A -> String
show {{showA}} x = to-string {{showA}} x

make-show : ∀ {a} {A : Set a} -> (A -> String) -> Show A
make-show show-impl = record
  { to-string = show-impl
  }
