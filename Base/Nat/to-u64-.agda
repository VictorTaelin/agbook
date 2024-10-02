module Base.Nat.to-u64- where

open import Base.Nat.Nat
open import Base.Nat.to-u64
open import Base.Nat.lt
open import Base.Bool.Bool
open import Base.U64.U64
open import Base.U64.to-nat
open import Base.Equal.Equal


-- Property: Converting 0 and back should result in 0
T0 : to-nat (to-u64 0) ≡ 0
T0 = refl

-- Property: Converting 1 and back should result in 1
T1 : to-nat (to-u64 1) ≡ 1
T1 = refl

-- Property: Converting a number larger than U64 max value should wrap around
T2 : to-nat (to-u64 18446744073709551616) ≡ 0
T2 = refl

