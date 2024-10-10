module Base.Equal.sym where

open import Base.Equal.Equal

-- Symmetry property of equality.
-- 1st: The value.
-- 2nd: The value.
-- 3rd: Proof that 1st is equal to 2nd.
-- = Proof that 2nd is equal to 1st.
sym : ∀ {a} {A : Set a} {x y : A} → x ≡ y → y ≡ x
sym refl = refl

