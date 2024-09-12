module Data.String.Test.eq where

open import Data.String.Type
open import Data.String.eq
open import Data.Bool.Type
open import Data.Equal.Type

-- Eq tests
_ : ("hello" == "hello") === True
_ = refl

_ : ("hello" == "world") === False
_ = refl

_ : ("hello" != "world") === True
_ = refl

_ : ("" == "") === True
_ = refl

