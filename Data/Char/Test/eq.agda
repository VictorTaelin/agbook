module Data.Char.Test.eq where

open import Data.Char.Type
open import Data.Char.eq
open import Data.Bool.Type
open import Data.Equal.Type

-- Eq tests
_ : ('a' == 'a') === True
_ = refl

_ : ('a' == 'b') === False
_ = refl

_ : ('0' == '0') === True
_ = refl
