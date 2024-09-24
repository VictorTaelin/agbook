module Base.Bool.if where

open import Base.Bool.Type

infix 0 if_then_else_

-- Conditional expression.
-- - x: The boolean condition to evaluate.
-- - t: The value to return if the condition is true.
-- - f: The value to return if the condition is false.
-- = Either t or f, depending on the condition.
if_then_else_ : ∀ {a} {A : Set a} -> Bool -> A -> A -> A
if True  then t else _ = t
if False then _ else f = f

-- NOTE: Avoid using this. Prefer Agda's 'with' instead.
-- NOTE: On TypeScript, always prefer the native 'if'.
