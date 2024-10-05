module Base.Char.eq- where

open import Base.Char.Char
open import Base.Char.eq
open import Base.Bool.Bool
open import Base.Bool.not
open import Base.Equal.Equal

-- Tests if 'a' is equal to 'a'.
T0 : ('a' == 'a') ≡ True
T0 = refl

-- Tests if 'a' is equal to 'b'.
T1 : ('a' == 'b') ≡ False
T1 = refl

-- Tests if '0' is equal to '0'.
T2 : ('0' == '0') ≡ True
T2 = refl

-- Tests if '0' is equal to '1'.
T3 : ('0' == '1') ≡ False
T3 = refl

-- Tests if 'A' is equal to 'a'.
T4 : ('A' == 'a') ≡ False
T4 = refl

-- Tests if negation of equality works correctly.
T5 : (! ('a' == 'b')) ≡ True
T5 = refl