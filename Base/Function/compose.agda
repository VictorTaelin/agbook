module Base.Function.compose where

-- Composes two functions.
-- - f: The outer function.
-- - g: The inner function.
-- = A new function that applies g, then f.
compose : ∀ {A B C : Set} → (B → C) → (A → B) → (A → C)
compose f g x = f (g x)

-- Infix operator for function composition
_<>_ : ∀ {A B C : Set} → (B → C) → (A → B) → (A → C)
_<>_ = compose

infixr 9 _<>_

