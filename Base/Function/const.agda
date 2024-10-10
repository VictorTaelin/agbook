module Base.Function.const where

-- Constant function.
-- - x: The value to be returned.
-- - _: The ignored input.
-- = Always returns x, regardless of the second argument.
const : ∀ {a b} {A : Set a} {B : Set b} → A → B → A
const x _ = x

