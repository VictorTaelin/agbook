module Data.String.eq where

open import Data.String.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Trait.Eq public

instance
  EqString : Eq String
  EqString = record
    { eq = eq-string
    ; neq = neq-string
    }
    where
      eq-string : String → String → Bool
      eq-string = primStringEquality

      neq-string : String → String → Bool
      neq-string x y = not (eq-string x y)
