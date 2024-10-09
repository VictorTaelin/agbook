module Base.Nat.apply where

open import Base.Nat.Nat
open import Base.Function.id

-- Applies a function n times to an initial argument.
-- - n: The number of times to apply the function.
-- - f: The function to apply.
-- - x: The initial argument.
-- = The result of applying f to x, n times.
apply : ∀ {A : Set} → Nat → (A → A) → A → A
apply Zero     f x = x
apply (Succ n) f x = f (apply n f x)

