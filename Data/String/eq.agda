module Data.String.eq where

open import Data.String.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Equal.Type
open import Data.Trait.Eq

primitive
  primStringEquality : String → String → Bool

instance
  EqString : Eq String
  EqString = record
    { _≡_ = primStringEquality
    ; _≠_ = λ x y → not (primStringEquality x y)
    }

-- Testes
_ : ("hello" == "hello") === True
_ = refl

_ : ("hello" == "world") === False
_ = refl