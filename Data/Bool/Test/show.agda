module Data.Bool.Test.eq where

open import Data.Bool.Type
open import Data.Bool.show
open import Data.String.Type
open import Data.Trait.Show
open import Data.Equal.Type

-- Show tests

_ : show True === "true"
_ = refl

_ : show False === "false"
_ = refl
