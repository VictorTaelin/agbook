module Data.Vector.Test.eq where

open import Data.Vector.Type
open import Data.Vector.eq
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Trait.Eq
open import Data.Equal.Type

-- Eq tests

_ : ((1 :: 2 :: 3 :: []) != (1 :: 2 :: 4 :: [])) === True
_ = refl

_ : ([] != ([] {A = Nat})) === False
_ = refl

_ : ((1 :: 2 :: 3 :: []) == (1 :: 2 :: 3 :: [])) === True
_ = refl

_ : ((1 :: 2 :: []) == (1 :: 3 :: [])) === False
_ = refl
