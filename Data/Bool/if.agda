module Data.Bool.if where

open import Data.Bool.Main

-- Conditional expression.
-- - x: The boolean condition to evaluate.
-- - t: The value to return if the condition is true.
-- - f: The value to return if the condition is false.
-- = Either t or f, depending on the condition.
if_then_else : ∀ {a} {A : Set a} → Bool → A → A → A
if true  then t else _ = t
if false then _ else f = f
