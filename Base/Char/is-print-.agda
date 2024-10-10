module Base.Char.is-print- where

open import Base.Char.Char
open import Base.Char.is-print
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: Lowercase letter 'a' is printable
T0 : is-print 'a' ≡ True
T0 = refl

-- Test: Uppercase letter 'Z' is printable
T1 : is-print 'Z' ≡ True
T1 = refl

-- Test: Digit '5' is printable
T2 : is-print '5' ≡ True
T2 = refl

-- Test: Special character '@' is printable
T3 : is-print '@' ≡ True
T3 = refl

-- Test: Space character is printable
T4 : is-print ' ' ≡ True
T4 = refl

-- Test: Newline character is not printable
T5 : is-print '\n' ≡ False
T5 = refl

-- Test: Tab character is not printable
T6 : is-print '\t' ≡ False
T6 = refl

-- Test: Null character is not printable
T7 : is-print '\0' ≡ False
T7 = refl

