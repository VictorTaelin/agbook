module Base.List.Test.split-last where

open import Base.List.List
open import Base.List.split-last
open import Base.List.eq
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Bool.Bool
open import Base.Bool.eq
open import Base.Equal.Equal
open import Base.Pair.Pair
open import Base.Pair.eq

-- Helper function to test if a number is even
is-even : Nat → Bool
is-even Zero = True
is-even (Succ Zero) = False
is-even (Succ (Succ n)) = is-even n

-- Test splitting an empty list
_ : split-last is-even [] ≡ ([] , [])
_ = refl

-- Test splitting a list with no matching elements
_ : split-last is-even (1 :: 3 :: 5 :: []) ≡ (1 :: 3 :: 5 :: [] , [])
_ = refl

-- Test splitting a list with one matching element at the end
_ : split-last is-even (1 :: 3 :: 2 :: []) ≡ (1 :: 3 :: [] , [])
_ = refl

-- Test splitting a list with one matching element at the beginning
_ : split-last is-even (2 :: 1 :: 3 :: []) ≡ ([] , 1 :: 3 :: [])
_ = refl

-- Test splitting a list with multiple matching elements
_ : split-last is-even (1 :: 2 :: 3 :: 4 :: 5 :: 6 :: []) ≡ (1 :: 2 :: 3 :: 4 :: 5 :: [] , [])
_ = refl

-- Test splitting a list where all elements match
_ : split-last is-even (2 :: 4 :: 6 :: 8 :: []) ≡ (2 :: 4 :: 6 :: [] , [])
_ = refl

