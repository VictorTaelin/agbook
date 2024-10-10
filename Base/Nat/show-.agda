module Base.Nat.show- where

open import Base.Nat.Nat
open import Base.Nat.show
open import Base.String.String
open import Base.Equal.Equal

-- Use N/exp
--  Test: show 42 = "42"
T0 : show 42 ≡ "42"
T0 = refl

--  Test: show 0 = "0"
T1 : show 0 ≡ "0"
T1 = refl

-- Use N/exp
--  Test: show 1000 = "1000"
T2 : show 1000 ≡ "1000"
T2 = refl

