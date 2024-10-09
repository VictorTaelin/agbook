module Base.Trait.Show where

open import Agda.Primitive
open import Base.String.String

record Show {a} (A : Set a) : Set (lsuc a) where
  constructor MkShow
  field
    to-string : A → String

  show = to-string

open Show {{...}} public

