module Base.List.starts-with where

import Base.Trait.Eq as Eq
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.List.List
open import Base.List.eq
open import Base.List.length
open import Base.List.take
open import Base.Nat.eq

-- Checks if one list starts with another list.
-- - prefix: The potential prefix list.
-- - xs: The list to check against.
-- = True if xs starts with prefix, False otherwise.
starts-with : ∀ {A : Set} -> {{EqA : Eq.Eq A}} -> List A -> List A -> Bool
starts-with prefix xs = do
  let prefix-length = length prefix
  let xs-prefix     = take prefix-length xs
  (Base.List.eq._==_ xs-prefix prefix) && (Base.Nat.eq._==_ (length xs-prefix) (length prefix))
