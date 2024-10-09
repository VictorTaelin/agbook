module Base.List.Test.unsnoc where

open import Base.List.List
open import Base.List.unsnoc
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.Nat.Nat
open import Base.Equal.Equal

-- Test unsnoc on an empty list
_ : unsnoc ([] {A = Nat}) ≡ ([] , None)
_ = refl

-- Test unsnoc on a list with one element
_ : unsnoc (5 :: []) ≡ ([] , Some 5)
_ = refl

-- Test unsnoc on a list with multiple elements
_ : unsnoc (1 :: 2 :: 3 :: []) ≡ (1 :: 2 :: [] , Some 3)
_ = refl

