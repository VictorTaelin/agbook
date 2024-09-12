module Data.U64.Test.eq where

open import Data.U64.Type
open import Data.U64.eq
open import Data.Bool.Type
open import Data.Trait.Eq
open import Data.Equal.Type

-- Eq tests
_ : (42 == 42) === True
_ = refl

_ : (42 == 43) === False
_ = refl

_ : (64 != 64) === False
_ = refl

_ : (64 != 65) === True
_ = refl
