module Base.String.Test.to-nat-base where

open import Base.String.Type
open import Base.Nat.Type
open import Base.Maybe.Type
open import Base.Equal.Type
open import Base.String.to-nat-base

-- Test case for base 10, valid input
_ : to-nat-base 10 "123" === Some 123
_ = refl

-- Test case for base 2 (binary), valid input
_ : to-nat-base 2 "1010" === Some 10
_ = refl

-- Test case for base 16 (hexadecimal), valid input
_ : to-nat-base 16 "1A" === Some 26
_ = refl

-- Test case for empty string input
_ : to-nat-base 10 "" === None
_ = refl

-- Test case for invalid input (contains non-digit character)
_ : to-nat-base 10 "12a3" === None
_ = refl
-- Test case for single digit input
_ : to-nat-base 10 "7" === Some 7
_ = refl

-- Test case for leading zeros
_ : to-nat-base 10 "007" === Some 7
_ = refl

-- Test case for base 8 (octal), valid input
_ : to-nat-base 8 "17" === Some 15
_ = refl
