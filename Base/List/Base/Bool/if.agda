module Base.Bool.if where

open import Base.Bool.Type

-- Conditional expression.
-- - cond: The condition to evaluate.
-- - then: The value to return if the condition is true.
-- - else: The value to return if the condition is false.
-- = The 'then' value if 'cond' is True, otherwise the 'else' value.
if_then_else_ : ∀ {a} {A : Set a} → Bool → A → A → A
if True  then x else y = x
if False then x else y = y

{-# BUILTIN IF if_then_else_ #-}