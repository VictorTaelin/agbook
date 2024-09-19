module Base.Pair.Test.show where

open import Base.Pair.Type
open import Base.Pair.show
open import Base.Nat.Type
open import Base.Nat.show
open import Base.Bool.Type
open import Base.Bool.show
open import Base.String.Type
open import Base.Equal.Type

test-show-nat-bool : show (1 , True) === "(1, true)"
test-show-nat-bool = refl

test-show-nat-bool-2 : show (42 , False) === "(42, false)"
test-show-nat-bool-2 = refl

test-show-nat-nat : show (1 , 1) === "(1, 1)"
test-show-nat-nat = refl