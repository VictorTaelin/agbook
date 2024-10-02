module Base.Nat.add- where

open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: 0 + 0 = 0
T0 : (0 + 0) ≡ 0
T0 = refl

-- Test: 0 + 5 = 5
T1 : (0 + 5) ≡ 5
T1 = refl

-- Test: 5 + 0 = 5
T2 : (5 + 0) ≡ 5
T2 = refl

-- Test: 3 + 2 = 5
T3 : (3 + 2) ≡ 5
T3 = refl

-- Test: 7 + 8 = 15
T4 : (7 + 8) ≡ 15
T4 = refl

-- Test: Commutativity: a + b = b + a
T5 : (3 + 4) ≡ (4 + 3)
T5 = refl

-- Test: Associativity: (a + b) + c = a + (b + c)
T6 : ((2 + 3) + 4) ≡ (2 + (3 + 4))
T6 = refl