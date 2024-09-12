module Data.Pair.Test.eq where

open import Data.Pair.Type
open import Data.Pair.eq
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Char.Type
open import Data.Char.eq
open import Data.Equal.Type

-- Eq tests
_ : ((1 , True) == (1 , True)) === True
_ = refl

_ : ((1 , True) == (2 , True)) === False
_ = refl

_ : ((1 , True) != (1 , False)) === True
_ = refl

_ : ((1 , 'a') == (1 , 'a')) === True
_ = refl

_ : ((1 , 'a') == (2 , 'a')) === False
_ = refl