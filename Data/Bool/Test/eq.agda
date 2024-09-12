module Data.Bool.Test.eq where

open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Equal.Type

-- Tests
_ : (True == True) === True
_ = refl

_ : (False == True) === False
_ = refl

_ : (True != False) === True
_ = refl
