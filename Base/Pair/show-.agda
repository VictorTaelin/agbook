module Base.Pair.show- where

open import Base.Pair.Pair
open import Base.Pair.show
open import Base.Nat.Nat
open import Base.Nat.show
open import Base.Bool.Bool
open import Base.Bool.show
open import Base.String.String
open import Base.Equal.Equal


T0 : show (1 , True) ≡ "(1, true)"
T0 = refl

T1 : show (42 , False) ≡ "(42, false)"
T1 = refl

T2 : show (1 , 1) ≡ "(1, 1)"
T2 = refl