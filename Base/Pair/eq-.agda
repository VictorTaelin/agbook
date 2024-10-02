module Base.Pair.eq- where

open import Base.Pair.Pair
open import Base.Pair.eq
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Bool.Bool
open import Base.Bool.eq
open import Base.Char.Char
open import Base.Char.eq
open import Base.Equal.Equal

T0 : ((1 , True) == (1 , True)) ≡ True
T0 = refl

T1 : ((1 , True) == (2 , True)) ≡ False
T1 = refl

T2 : ((1 , True) != (1 , False)) ≡ True
T2 = refl

T3 : ((1 , 'a') == (1 , 'a')) ≡ True
T3 = refl

T4 : ((1 , 'a') == (2 , 'a')) ≡ False
T4 = refl