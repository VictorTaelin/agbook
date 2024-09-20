module Base.Float.eq where

open import Base.Float.Type
open import Base.Bool.Type

eq : Float → Float → Bool
eq = primFloatEquality
