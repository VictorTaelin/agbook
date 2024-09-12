module Data.Float.eq where

open import Data.Float.Type
open import Data.Bool.Type
open import Data.Bool.not
open import Data.Trait.Eq public

instance
  EqFloat : Eq Float
  EqFloat = record
    { eq = eq-float
    ; neq = neq-float
    }
    where
      eq-float : Float → Float → Bool
      eq-float = primFloatEquality

      neq-float : Float → Float → Bool
      neq-float x y = not (eq-float x y)
