module Base.Float.show where

open import Base.Float.Type
open import Base.String.Type

primitive
  primShowFloat : Float -> String

show : Float -> String
show = primShowFloat
