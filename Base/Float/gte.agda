module Base.Float.gte where

open import Base.Float.Type
open import Base.Bool.Type
open import Base.Bool.not

gte : Float → Float → Bool
gte x y = not (primFloatLess x y)
