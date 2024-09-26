module Base.Char.Test.eq where

open import Base.Char.Char
open import Base.Char.eq
open import Base.Bool.Bool
open import Base.Equal.Equal

test-eq-a-a : ('a' == 'a') ≡ True
test-eq-a-a = refl

test-eq-a-b : ('a' == 'b') ≡ False
test-eq-a-b = refl

test-eq-0-0 : ('0' == '0') ≡ True
test-eq-0-0 = refl
