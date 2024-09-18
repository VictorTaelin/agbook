module Base.String.eq where

open import Base.String.Type
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Trait.Eq public

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
