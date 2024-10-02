module Base.Nat.max- where

open import Base.Nat.Nat
open import Base.Nat.max
open import Base.Equal.Equal


-- Test: max 0 0 = 0
T0 : max 0 0 ≡ 0
T0 = refl

-- Test: max 0 5 = 5
T1 : max 0 5 ≡ 5
T1 = refl

-- Test: max 5 0 = 5
T2 : max 5 0 ≡ 5
T2 = refl

-- Test: max 3 2 = 3
T3 : max 3 2 ≡ 3
T3 = refl

-- Test: max 2 3 = 3
T4 : max 2 3 ≡ 3
T4 = refl

-- Test: max 7 7 = 7
T5 : max 7 7 ≡ 7
T5 = refl

-- Test: Commutativity: max a b = max b a
T6 : max 4 6 ≡ max 6 4
T6 = refl

-- Test: Idempotence: max a a = a
T7 : max 8 8 ≡ 8
T7 = refl

-- Test: Associativity: max a (max b c) = max (max a b) c
T8 : max 2 (max 3 4) ≡ max (max 2 3) 4
T8 = refl
