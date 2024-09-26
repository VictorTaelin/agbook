module Base.Bits.Test.succ where

open import Base.Bits.Bits
open import Base.Bits.succ
open import Base.Bool.Bool
open import Base.Equal.Equal

test-succ-empty : succ E ≡ I E
test-succ-empty = refl

test-succ-zero : succ (O E) ≡ I E
test-succ-zero = refl

test-succ-one : succ (I E) ≡ O (I E)
test-succ-one = refl

test-succ-two : succ (O (I E)) ≡ I (I E)
test-succ-two = refl

test-succ-three : succ (I (I E)) ≡ O (O (I E))
test-succ-three = refl

test-succ-seven : succ (I (I (I E))) ≡ O (O (O (I E)))
test-succ-seven = refl


