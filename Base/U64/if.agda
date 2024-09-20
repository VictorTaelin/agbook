module Base.U64.if where 

open import Base.U64.Type 
open import Base.Bool.Type 
open import Base.Nat.Type
open import Base.U64.to-nat

infix 0 if_then_else_

-- Conditional expression for U64.
-- - n: The U64 condition to evaluate (non-zero is considered true).
-- - t: The value to return if the condition is true (non-zero).
-- - f: The value to return if the condition is false (zero).
-- = Either t or f, depending on the condition.
if_then_else_ : ∀ {a} {A : Set a} → U64 → A → A → A
if n then t else f = helper (to-nat n) t f
  where 
   helper : ∀ {a} {A : Set a} → Nat → A → A → A 
   helper Zero t f = f
   helper (Succ _) t f = t
