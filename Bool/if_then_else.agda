module Bool.if_then_else where

open import Bool.Main

-- Conditional expression
-- - condition: the boolean condition to evaluate
-- - thenBranch: the value to return if the condition is true
-- - elseBranch: the value to return if the condition is false
-- = the value of either thenBranch or elseBranch, depending on the condition
if_then_else_ : ∀ {a} {A : Set a} → Bool → A → A → A
if true  then x else _ = x
if false then _ else y = y
