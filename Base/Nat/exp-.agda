module Base.Nat.exp- where

open import Base.Nat.Nat
open import Base.Nat.exp
open import Base.Nat.mul
open import Base.Equal.Equal

-- Tests the exponentiation function with various inputs.

-- Test: 2⁰ = 1
T0 : (2 ** 0) ≡ 1
T0 = refl

-- Test: 2¹ = 2
T1 : (2 ** 1) ≡ 2
T1 = refl

-- Test: 2² = 4
T2 : (2 ** 2) ≡ 4
T2 = refl

-- Test: 3² = 9
T3 : (3 ** 2) ≡ 9
T3 = refl

-- Test: 5¹ = 5
T4 : (5 ** 1) ≡ 5
T4 = refl

-- Test: 10⁰ = 1
T5 : (10 ** 0) ≡ 1
T5 = refl

-- Test: 3³ = 27
T6 : (3 ** 3) ≡ 27
T6 = refl

-- Test: 1⁵ = 1
T7 : (1 ** 5) ≡ 1
T7 = refl

-- Test: 0² = 0
T8 : (0 ** 2) ≡ 0
T8 = refl

-- Test: Exponentiation property: (a^b)^c = a^(b*c)
T9 : ((2 ** 3) ** 2) ≡ (2 ** (3 * 2))
T9 = refl