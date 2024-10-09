module Base.Nat.match- where

open import Base.Equal.Equal
open import Base.Nat.match
open import Base.Nat.Nat
open import Base.String.String

-- A simple function that returns a string description of a natural number
describe : Nat → String
describe = match (λ _ → String) 
                  "zero"
                  (λ _ → "successor")

-- Tests
T0 : describe Zero ≡ "zero"
T0 = refl

T1 : describe (Succ Zero) ≡ "successor"
T1 = refl

