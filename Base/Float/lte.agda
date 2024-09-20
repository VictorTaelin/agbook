module Base.Float.lte where

open import Base.Float.Type
open import Base.Bool.Type
open import Base.Bool.not

lte : Float → Float → Bool
lte x y = not (primFloatLess y x)
