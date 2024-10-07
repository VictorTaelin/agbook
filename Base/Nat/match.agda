module Base.Nat.match where

open import Base.Nat.Nat

-- Applies a function to a natural number based on its structure.
-- 1st: A type-level function that determines the return type for each case.
-- 2nd: The value to return in the zero case.
-- 3rd: The function to apply in the successor case.
-- 4th: The natural number to match on.
-- = The result of matching on the input natural number.
match : ∀ {A} → (P : Nat → Set A) → P Zero → (∀ n → P (Succ n)) → (n : Nat) → P n               
match P z s Zero = z
match P z s (Succ n) = s n

