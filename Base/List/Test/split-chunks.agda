module Base.List.Test.split-chunks where

open import Base.List.List
open import Base.List.split-chunks
open import Base.List.eq
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Bool.Bool
open import Base.Bool.eq
open import Base.Equal.Equal

-- Helper function to check if a number is even
is-even : Nat → Bool
is-even Zero = True
is-even (Succ Zero) = False
is-even (Succ (Succ n)) = is-even n

-- To help the type checker
test : (Nat → Bool) → List Nat → List (List Nat)
test p l = split-chunks p l

-- Test splitting an empty list
_ : test (λ _ → True) [] ≡ []
_ = refl

-- Test splitting a list where no elements satisfy the predicate
_ : test (λ _ → False) (1 :: 2 :: 3 :: []) ≡ ((1 :: 2 :: 3 :: []) :: [])
_ = refl

-- Test splitting a list where all elements satisfy the predicate
_ : test (λ _ → True) (1 :: 2 :: 3 :: []) ≡ ([] :: (1 :: []) :: (2 :: []) :: (3 :: []) :: [])
_ = refl

-- Test splitting a list of numbers by even numbers
_ : test is-even (1 :: 2 :: 3 :: 4 :: 5 :: 6 :: []) ≡ ((1 :: []) :: (2 :: 3 :: []) :: (4 :: 5 :: []) :: (6 :: []) :: [])
_ = refl

-- Test splitting a list where the first element satisfies the predicate
_ : test is-even (2 :: 1 :: 3 :: 4 :: 5 :: []) ≡ ([] :: (2 :: 1 :: 3 :: []) :: (4 :: 5 :: []) :: [])
_ = refl

