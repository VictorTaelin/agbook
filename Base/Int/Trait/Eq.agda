module Base.Int.Trait.Eq where

open import Base.Trait.Eq
open import Base.Int.Type
open import Base.Int.eq as Int

instance
  EqInt : Eq Int
  EqInt = make-eq Int.eq
