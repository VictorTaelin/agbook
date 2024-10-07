module Base.Equal.trans where

open import Base.Equal.Equal

-- Transitivity property of equality.
-- 1st: The value.
-- 2nd: The value.
-- 3rd: The value.
-- 4th: Proof that 1st is equal to 2nd.
-- 5th: Proof that 2nd is equal to 3rd.
-- = Proof that 1st is equal to 3rd.
trans : ∀ {a} {A : Set a} {x y z : A} → x ≡ y → y ≡ z → x ≡ z
trans refl refl = refl
