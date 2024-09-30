module Base.Equal.left where

open import Base.Equal.Equal
open import Base.Equal.sym
open import Base.Equal.trans

-- Left equality property.
-- If a is equal to x and b is equal to x, then a is equal to b.
-- - x: The common value.
-- - a: The 1st value to compare.
-- - b: The 2nd value to compare.
-- - r: Proof that a is equal to x.
-- - s: Proof that b is equal to x.
-- = Proof that a is equal to b.
left : ∀ {a} {A : Set a} {x a b : A} → a ≡ x → b ≡ x → a ≡ b
left r s = trans r (sym s)
