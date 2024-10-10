module ARC.DSL.Functions.branch where

open import ARC.DSL.Types.Boolean.Boolean

-- Implements if-else branching.
-- - condition: The boolean condition to evaluate.
-- - a: The value to return if the condition is True.
-- - b: The value to return if the condition is False.
-- = Either 'a' or 'b', depending on the condition.
branch : ∀ {A : Set} → Boolean → A → A → A
branch True  a b = a
branch False a b = b

