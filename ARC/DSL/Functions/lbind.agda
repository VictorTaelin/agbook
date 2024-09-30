module ARC.DSL.Functions.lbind where

open import ARC.DSL.Types.Union.Union
open import Base.Function.id
open import Base.Nat.Nat

-- Implements left-binding for functions.
-- - f: The function to be left-bound.
-- - a: The value to be fixed as the leftmost argument.
-- = A new function with its leftmost argument fixed.
lbind : ∀ {A B C : Set} → (A → B → C) → A → (B → C)
lbind f a = λ b → f a b
