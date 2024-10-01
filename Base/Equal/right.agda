module Base.Equal.right where

open import Base.Equal.Equal
open import Base.Equal.sym
open import Base.Equal.trans

-- Right equality property.
-- If x is equal to a and x is equal to b, then a is equal to b.
-- 1st: The common value.
-- 2nd: The value to compare.
-- 3rd: The value to compare.
-- 4th: Proof that 1st is equal to 2nd.
-- 5th: Proof that 1st is equal to 3rd.
-- = Proof that 3rd is equal to 4th.
right : ∀ {a} {A : Set a} {x a b : A} → x ≡ a → x ≡ b → a ≡ b
right r s = trans (sym r) s
