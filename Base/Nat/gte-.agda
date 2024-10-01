module Base.Nat.gte- where

open import Base.Nat.Nat
open import Base.Nat.gte
open import Base.Bool.Bool
open import Base.Equal.Equal

test-gte-1 : (5 >= 3) ≡ True
test-gte-1 = refl

test-gte-2 : (3 >= 5) ≡ False
test-gte-2 = refl

test-gte-3 : (4 >= 4) ≡ True
test-gte-3 = refl

test-gte-4 : (0 >= 0) ≡ True
test-gte-4 = refl

test-gte-5 : (1 >= 0) ≡ True
test-gte-5 = refl

test-gte-6 : (0 >= 1) ≡ False
test-gte-6 = refl

test-gte-7 : (Succ (Succ Zero) >= Succ Zero) ≡ True
test-gte-7 = refl

test-gte-8 : (Succ Zero >= Succ (Succ Zero)) ≡ False
test-gte-8 = refl

test-gte-9 : (Zero >= Zero) ≡ True
test-gte-9 = refl
