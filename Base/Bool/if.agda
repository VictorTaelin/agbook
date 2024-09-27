module Base.Bool.if where

open import Base.Bool.Bool

-- Conditional expression.
-- - x: The boolean condition to evaluate.
-- - t: The value to return if the condition is true.
-- - f: The value to return if the condition is false.
-- = Either t or f, depending on the condition.
if_then_else_ : ∀ {a} {A : Set a} → Bool → A → A → A
if True  then t else _ = t
if False then _ else f = f

infix 0 if_then_else_
