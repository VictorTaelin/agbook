module Base.List.split-first- where

open import Base.List.List
open import Base.List.split-first
open import Base.Bool.Bool
open import Base.Bool.eq
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Pair.Pair
open import Base.Pair.eq
open import Base.Equal.Equal

private
  is-even : Nat → Bool
  is-even Zero = True
  is-even (Succ Zero) = False
  is-even (Succ (Succ n)) = is-even n

-- Test: Empty list
_ : split-first is-even [] ≡ ([] , [])
_ = refl

-- Test: Single element list (even)
_ : split-first is-even (0 :: []) ≡ ([] , [])
_ = refl

-- Test: Single element list (odd)
_ : split-first is-even (1 :: []) ≡ (1 :: [] , [])
_ = refl

-- Test: List with even number at the beginning
_ : split-first is-even (0 :: 1 :: 2 :: 3 :: []) ≡ ([] , 1 :: 2 :: 3 :: [])
_ = refl

-- Test: List with even number in the middle
_ : split-first is-even (1 :: 3 :: 2 :: 5 :: []) ≡ (1 :: 3 :: [] , 5 :: [])
_ = refl

-- Test: List with even number at the end
_ : split-first is-even (1 :: 3 :: 5 :: 4 :: []) ≡ (1 :: 3 :: 5 :: [] , [])
_ = refl

-- Test: List with no even numbers
_ : split-first is-even (1 :: 3 :: 5 :: 7 :: []) ≡ (1 :: 3 :: 5 :: 7 :: [] , [])
_ = refl

-- Test: List with all even numbers
_ : split-first is-even (2 :: 4 :: 6 :: 8 :: []) ≡ ([] , 4 :: 6 :: 8 :: [])
_ = refl

