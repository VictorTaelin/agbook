module Data.Char.eq where

open import Data.Char.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Equal.Type
open import Data.Trait.Eq

primitive
  primCharEquality : Char → Char → Bool

instance
  EqChar : Eq Char
  EqChar = record
    { eq = primCharEquality
    ; neq = λ x y → not (primCharEquality x y)
    }