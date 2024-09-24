module Base.Float.lt where

open import Base.Float.Type
open import Base.Bool.Type

primitive
  primFloatLess : Float -> Float -> Bool

lt : Float -> Float -> Bool
lt = primFloatLess

infix 4 _<_
_<_ : Float -> Float -> Bool
_<_ = lt
