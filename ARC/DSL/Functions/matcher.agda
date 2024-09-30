module ARC.DSL.Functions.matcher where

open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Functions.equality
open import Base.Trait.Eq

-- Creates a matcher function that compares the result of a given function with a target value.
-- - A: The input type of the function.
-- - B: The output type of the function and the type of the target value.
-- - fn: The function to apply before comparison.
-- - target: The target value to compare against.
-- = A new function that takes an input of type A and returns a Boolean.
matcher : ∀ {A B : Set} → {{_ : Eq B}} → (A → B) → B → A → Boolean
matcher fn target x = equality (fn x) target
