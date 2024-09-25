module Base.Char.Test.eq where

open import Base.Char.Type
open import Base.Char.eq
open import Base.Bool.Type
open import Base.Equal.Type

test-eq-a-a : ('a' == 'a') ≡ True
test-eq-a-a = refl

test-eq-a-b : ('a' == 'b') ≡ False
test-eq-a-b = refl

test-eq-0-0 : ('0' == '0') ≡ True
test-eq-0-0 = refl
