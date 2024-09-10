module Data.Char.eq where

open import Data.Char.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Equal.Type
open import Data.Class.Eq

primitive
  primCharEquality : Char → Char → Bool

instance
  EqChar : Eq Char
  EqChar = record
    { _≡_ = primCharEquality
    ; _≠_ = λ x y → not (primCharEquality x y)
    }

-- Testes
_ : ('a' == 'a') === True
_ = refl

_ : ('a' == 'b') === False
_ = refl
