module Base.Float.eq where

open import Base.Float.Type
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Eq.Trait public

-- Instance of Eq typeclass for Float
-- Compares two Float values for equality
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
