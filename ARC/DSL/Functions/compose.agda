module ARC.DSL.Functions.compose where

-- Composes two functions.
-- - g: The outer function.
-- - f: The inner function.
-- - x: The input to the composed function.
-- = The result of applying f to x, then g to that result.
compose : ∀ {A B C : Set} → (B → C) → (A → B) → A → C
compose g f x = g (f x)

