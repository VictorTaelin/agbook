module ARC.DSL.Functions.identity where

-- Identity function
-- - x: The input.
-- = The same input x, unchanged.
identity : ∀ {A : Set} → A → A
identity x = x
