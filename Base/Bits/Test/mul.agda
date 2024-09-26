module Base.Bits.Test.mul where

open import Base.Bits.Bits
open import Base.Bits.mul
open import Base.Bits.from-nat
open import Base.Bits.to-nat
open import Base.Nat.Nat
open import Base.Equal.Equal

test-mul-zero : (I (I E)) * E ≡ E
test-mul-zero = refl

test-mul-one : (I (O (I E))) * (I E) ≡ (I (O (I E)))
test-mul-one = refl

test-mul-non-trivial : (I (O (I E))) * (I (I E)) ≡ (I (I (I (I E))))
test-mul-non-trivial = refl

test-mul-nat-conversion : to-nat ((from-nat 3) * (from-nat 2)) ≡ 6
test-mul-nat-conversion = refl

