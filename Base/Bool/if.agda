module Base.Bool.if where

open import Base.Bool.Bool

-- Performs a conditional operation based on a boolean value.
-- - 1st: The boolean condition to evaluate.
-- - 2nd: The value to return if the condition is true.
-- - 3td: The value to return if the condition is false.
-- = The value of 2nd if 1st is true, 3td otherwise.
if_then_else_ : ∀ {a} {A : Set a} → Bool → A → A → A
if True  then t else _ = t
if False then _ else f = f

-- Infix operator for if-then-else conditional.
infix 0 if_then_else_
