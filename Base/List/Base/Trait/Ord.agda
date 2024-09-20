module Base.Trait.Ord where

open import Base.Bool.Type

-- Trait for types that can be ordered
record Ord (A : Set) : Set where
  field
    _<_  : A → A → Bool
    _<=_ : A → A → Bool
    _>_  : A → A → Bool
    _>=_ : A → A → Bool