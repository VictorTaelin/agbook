module Data.List.Test.eq where

open import Data.List.Type
open import Data.List.eq
open import Data.Nat.Type
open import Data.Bool.Type
open import Data.String.Type
open import Data.Trait.Eq
open import Data.Equal.Type

-- Eq tests

_ : ((1 :: 2 :: 3 :: []) == (1 :: 2 :: 4 :: [])) === false
_ = refl

_ : ([] == ([] {A = Nat})) === true
_ = refl

_ : ((1 :: 2 :: 3 :: []) == (1 :: 2 :: 3 :: [])) === True
_ = refl

_ : ((1 :: 2 :: []) == (1 :: 2 :: 3 :: [])) === False
_ = refl

_ : ((True :: False :: []) != (True :: True :: [])) === True
_ = refl
