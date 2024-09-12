module Data.Maybe.Test.eq where

open import Data.Maybe.Type
open import Data.Maybe.eq
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Equal.Type

-- Eq tests
_ : ((Some 42) == (Some 42)) === True
_ = refl

_ : ((Some 42) == (Some 43)) === False
_ = refl

_ : (None == None) === True
_ = refl

_ : ((Some 42) == None) === False
_ = refl
