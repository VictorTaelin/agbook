module Base.List.enumerate where

open import Base.List.List
open import Base.List.length
open import Base.List.zip
open import Base.Nat.Nat
open import Base.Nat.range
open import Base.Pair.Pair

enumerate : ∀ {A : Set} → List A → List (Pair Nat A)
enumerate xs = go 0 xs where
  go : ∀ {A : Set} → Nat → List A → List (Pair Nat A)
  go _ [] = []
  go n (x :: xs) = (n , x) :: go (Succ n) xs
