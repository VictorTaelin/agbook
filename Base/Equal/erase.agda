module Base.Equal.erase where

open import Base.Equal.Equal

primitive primEraseEquality : ∀ {a} {A : Set a} {x y : A} → x ≡ y → x ≡ y

-- Erases the content of an equality proof.
-- 1st: The value.
-- 2nd: The value.
-- = Erased equality proof.
erase : ∀ {a} {A : Set a} {x y : A} → x ≡ y → x ≡ y
erase = primEraseEquality

