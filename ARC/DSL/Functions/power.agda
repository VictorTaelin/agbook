module ARC.DSL.Functions.power where

open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Functions.compose
open import Base.Nat.eq
open import Base.Nat.sub

-- Raises a function to the nth power by repeated composition.
-- - f: The function to be raised to a power.
-- - n: The power to raise the function to.
-- = A new function that applies f n times.
power : ∀ {A : Set} → (A → A) → Integer → (A → A)
power f 0       = f
power f 1       = f
power f (Succ n) = compose f (power f n)

