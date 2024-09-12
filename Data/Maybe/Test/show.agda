module Data.Maybe.Test.show where

open import Data.Maybe.Type
open import Data.Maybe.show
open import Data.Nat.Type
open import Data.Nat.show
open import Data.String.Type
open import Data.Equal.Type

test-show-some : show (Some 42) === "Some(42)"
test-show-some = refl

test-show-none-nat : show (None {A = Nat}) === "None"
test-show-none-nat = refl

test-show-none : show None === "None"
test-show-none = refl
