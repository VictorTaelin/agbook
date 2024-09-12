module Data.Float.Test.eq where

open import Data.Float.Type
open import Data.Float.eq
open import Data.Float.Operations
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Equal.Type

equal : Float → Float → Bool
equal x y = primFloatLess (primFloatMinus x y) 0.000001 
         && primFloatLess (primFloatMinus y x) 0.000001

-- Eq tests

_ : (0.0 == -0.0) === True
_ = refl

_ : (3.14 == 3.14) ===  True
_ = refl

_ : ((1.1 f+ 2.2) == 3.3) === False
_ = refl

_ : (equal (1.1 f+ 2.2) 3.3) === True
_ = refl

_ : (3.14 == 2.71) === False
_ = refl

_ : (3.14 != 3.14) === False
_ = refl

_ : (3.14 != 2.71) === True
_ = refl
