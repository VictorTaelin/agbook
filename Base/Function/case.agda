module Base.Function.case where

infix 0 case_of_
infix 0 case_returning_of_

-- Case expressions (to be used with pattern-matching lambdas).
-- - x: The value to match against.
-- - f: The function to apply to x.
-- = The result of applying f to x.
case_of_ : ∀ {A B : Set} → A → (A → B) → B
case x of f = f x

-- Case expressions with explicit return type.
-- - x: The value to match against.
-- - B: The return type, which may depend on x.
-- - f: The function to apply to x.
-- = The result of applying f to x.
case_returning_of_ : ∀ {A : Set} {B : A → Set} → (x : A) → (B : A → Set) → ((x : A) → B x) → B x
case x returning B of f = f x
