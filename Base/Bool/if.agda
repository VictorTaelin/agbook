module Base.Bool.if where

open import Base.Bool.Bool

-- Performs a conditional operation based on a boolean value.
-- - condition: The boolean condition to evaluate.
-- - thenBranch: The value to return if the condition is true.
-- - elseBranch: The value to return if the condition is false.
-- = The value of thenBranch if condition is true, elseBranch otherwise.
if_then_else_ : ∀ {a} {A : Set a} → Bool → A → A → A
if True  then t else _ = t
if False then _ else f = f

-- Infix operator for if-then-else conditional.
infix 0 if_then_else_
