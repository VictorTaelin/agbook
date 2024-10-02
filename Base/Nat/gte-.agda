module Base.Nat.gte- where

open import Base.Nat.Nat
open import Base.Nat.gte
open import Base.Bool.Bool
open import Base.Equal.Equal

T1 : (5 >= 3) ≡ True
T1 = refl

T2 : (3 >= 5) ≡ False
T2 = refl

T3 : (4 >= 4) ≡ True
T3 = refl

T4 : (0 >= 0) ≡ True
T4 = refl

T5 : (1 >= 0) ≡ True
T5 = refl

T6 : (0 >= 1) ≡ False
T6 = refl

T7 : (Succ (Succ Zero) >= Succ Zero) ≡ True
T7 = refl

T8 : (Succ Zero >= Succ (Succ Zero)) ≡ False
T8 = refl

T9 : (Zero >= Zero) ≡ True
T9 = refl


