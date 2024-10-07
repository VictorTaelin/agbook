module Base.Char.neq- where

open import Base.Char.Char
open import Base.Char.eq
open import Base.Char.neq
open import Base.Bool.Bool
open import Base.Bool.not
open import Base.Equal.Equal

-- Tests if 'a' is not equal to 'b'.
T0 : ('a' != 'b') ≡ True
T0 = refl

-- Tests if 'a' is not equal to 'a'.
T1 : ('a' != 'a') ≡ False
T1 = refl

-- Tests if '0' is not equal to '1'.
T2 : ('0' != '1') ≡ True
T2 = refl

-- Tests if '0' is not equal to '0'.
T3 : ('0' != '0') ≡ False
T3 = refl

-- Tests if 'A' is not equal to 'a'.
T4 : ('A' != 'a') ≡ True
T4 = refl

-- Tests if negation of inequality works correctly.
T5 : (! ('a' != 'b')) ≡ False
T5 = refl

-- Tests if space character is not equal to tab character.
T6 : (' ' != '\t') ≡ True
T6 = refl

-- Tests if newline character is not equal to carriage return.
T7 : ('\n' != '\r') ≡ True
T7 = refl