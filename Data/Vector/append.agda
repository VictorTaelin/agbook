module Data.Vector.append where

open import Data.Vector.Main
open import Data.Nat.Main
open import Data.Nat.add

-- Concatenates two vectors.
-- - xs: The 1st vector.
-- - ys: The 2nd vector.
-- = A new vector containing all elements from xs followed by all elements from ys.
_++_ : ∀ {A : Set} {m n : Nat} → Vector A m → Vector A n → Vector A (m + n)
[]        ++ ys = ys
(x :: xs) ++ ys = x :: (xs ++ ys)

infixr 5 _++_
