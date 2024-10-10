module Base.Equal.left where

open import Base.Equal.Equal
open import Base.Equal.sym
open import Base.Equal.trans

-- Left equality property.
-- 1st: The common value.
-- 2nd: The value to compare.
-- 3rd: The value to compare.
-- 4th: Proof that 2nd is equal to 1st.
-- 5th: Proof that 3rd is equal to 1st.
-- = Proof that 3rd is equal to 4th.
left : ∀ {a} {A : Set a} {x a b : A} → a ≡ x → b ≡ x → a ≡ b
left r s = trans r (sym s)

