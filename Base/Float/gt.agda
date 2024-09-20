module Base.Float.gt where

open import Base.Float.Type
open import Base.Bool.Type

gt : Float → Float → Bool
gt x y = primFloatLess y x
