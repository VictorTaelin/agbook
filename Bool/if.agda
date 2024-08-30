module Bool.if where

open import Bool.Main

-- Conditional expression.
-- - x: the boolean condition to evaluate.
-- - t: the value to return if the condition is true.
-- - f: the value to return if the condition is false.
-- = Either t or f, depending on the condition.
if_then_else : ∀ {a} {A : Set a} → Bool → A → A → A
if true  then t else _ = t
if false then _ else f = f
