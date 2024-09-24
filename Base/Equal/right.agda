module Base.Equal.right where

open import Base.Equal.Type
open import Base.Equal.sym
open import Base.Equal.trans

-- Right equality property.
-- If x is equal to a and x is equal to b, then a is equal to b.
-- - x: The common value.
-- - a: The 1st value to compare.
-- - b: The 2nd value to compare.
-- - r: Proof that x is equal to a.
-- - s: Proof that x is equal to b.
-- = Proof that a is equal to b.
right : ∀ {a} {A : Set a} {x a b : A} -> x === a -> x === b -> a === b
right r s = trans (sym r) s
