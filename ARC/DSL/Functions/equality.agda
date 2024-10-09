module ARC.DSL.Functions.equality where

open import ARC.DSL.Types.Boolean.Boolean
open import Base.Trait.Eq

-- Checks if two values of the same type are equal.
-- - A: The type of values being compared.
-- - x: The first value to compare.
-- - y: The second value to compare.
-- = True if x and y are equal, False otherwise.
equality : ∀ {A : Set} → {{_ : Eq A}} → A → A → Boolean
equality x y = x == y

