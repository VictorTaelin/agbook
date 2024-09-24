module Base.Equal.erase where

open import Base.Equal.Type

primitive primEraseEquality : ∀ {a} {A : Set a} {x y : A} -> x === y -> x === y

-- Erases the content of an equality proof.
-- - A: The type of the elements being compared.
-- - x: The 1st value.
-- - y: The 2nd value.
erase : ∀ {a} {A : Set a} {x y : A} -> x === y -> x === y
erase = primEraseEquality