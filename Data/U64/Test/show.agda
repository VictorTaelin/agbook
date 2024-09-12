module Data.U64.Test.show where

open import Data.U64.Type
open import Data.U64.show
open import Data.String.Type
open import Data.Trait.Show
open import Data.Equal.Type

-- Show tests
_ : show 42 === "42"
_ = refl

_ : show 0 === "0"
_ = refl
