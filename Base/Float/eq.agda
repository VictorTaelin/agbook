module Base.Float.eq where

open import Base.Float.Type
open import Base.Bool.Type

eq : Float → Float → Bool
eq = primFloatEquality

infix 4 _==_
_==_ : Float → Float → Bool
_==_ = eq
