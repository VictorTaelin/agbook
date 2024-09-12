module Data.Maybe.Test.eq where

open import Data.Maybe.Type
open import Data.Maybe.eq
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Trait.Eq
open import Data.Equal.Type

-- Eq tests
_ : ((Some 42) == (Some 42)) === True
_ = refl

_ : ((Some 42) == (Some 43)) === false
_ = refl

_ : (None == None) === true
_ = refl

_ : ((Some 42) == None) === false
_ = refl
