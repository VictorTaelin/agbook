module Base.List.enumerate where

open import Base.List.List
open import Base.Nat.Nat
open import Base.Pair.Pair


enumerate-go : ∀ {A : Set} → Nat → List A → List (Pair Nat A)
enumerate-go _ [] = []
enumerate-go n (x :: xs) = (n , x) :: enumerate-go (Succ n) xs

enumerate : ∀ {A : Set} → List A → List (Pair Nat A)
enumerate xs = enumerate-go 0 xs

