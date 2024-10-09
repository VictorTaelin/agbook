module Base.Char.hex-to-nat- where

open import Base.Char.Char
open import Base.Char.hex-to-nat
open import Base.Nat.Nat
open import Base.Maybe.Maybe
open import Base.Equal.Equal

-- Test: Converts '0' to 0.
T0 : hex-to-nat '0' ≡ Some 0
T0 = refl

-- Test: Converts 'A' to 10.
T1 : hex-to-nat 'A' ≡ Some 10
T1 = refl

-- Test: Converts 'f' to 15.
T2 : hex-to-nat 'f' ≡ Some 15
T2 = refl

-- Test: Handles an invalid hexadecimal character.
T3 : hex-to-nat 'G' ≡ None
T3 = refl

