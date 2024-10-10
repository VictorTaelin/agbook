module Base.Maybe.Test.show where

open import Base.Maybe.Maybe
open import Base.Maybe.show
open import Base.Nat.Nat
open import Base.Nat.show
open import Base.String.String
open import Base.Equal.Equal

test-show-some : show (Some 42) ≡ "Some(42)"
test-show-some = refl

test-show-none-nat : show (None {A = Nat}) ≡ "None"
test-show-none-nat = refl

test-show-none : show None ≡ "None"
test-show-none = refl

