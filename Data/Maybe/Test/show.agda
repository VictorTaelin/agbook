module Data.Maybe.Test.eq-show where

open import Data.Maybe.Type
open import Data.Maybe.show
open import Data.Nat.Type
open import Data.Nat.show
open import Data.String.Type
open import Data.Trait.Show
open import Data.Equal.Type
-- Show tests
_ : show (Some 42) === "Some(42)"
_ = refl

_ : show (None {A = Nat}) === "None"
_ = refl

_ : show None === "None"
_ = refl
