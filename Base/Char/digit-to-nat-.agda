module Base.Char.digit-to-nat- where

open import Base.Char.Char
open import Base.Char.digit-to-nat
open import Base.Nat.Nat
open import Base.Maybe.Maybe
open import Base.Equal.Equal

-- Test: '0' converts to Some 0
T0 : digit-to-nat '0' ≡ Some 0
T0 = refl

-- Test: '5' converts to Some 5
T1 : digit-to-nat '5' ≡ Some 5
T1 = refl

-- Test: '9' converts to Some 9
T2 : digit-to-nat '9' ≡ Some 9
T2 = refl

-- Test: 'a' converts to None
T3 : digit-to-nat 'a' ≡ None
T3 = refl

-- Test: '!' converts to None
T4 : digit-to-nat '!' ≡ None
T4 = refl

-- Test: ' ' (space) converts to None
T5 : digit-to-nat ' ' ≡ None
T5 = refl
