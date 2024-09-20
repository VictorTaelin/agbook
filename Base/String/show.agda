module Base.String.show where

open import Base.String.Type

primitive
  primShowString : String → String

show : String → String
show = primShowString
