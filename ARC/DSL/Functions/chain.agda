module ARC.DSL.Functions.chain where

open import Base.Function.id

-- Chains three functions together, applying them in sequence.
-- - h: The third function to apply.
-- - g: The second function to apply.
-- - f: The first function to apply.
-- - x: The input value.
-- = The result of applying f, then g, then h to x.
chain : ∀ {A B C D : Set} → (C → D) → (B → C) → (A → B) → A → D
chain h g f = λ x → h (g (f x))
