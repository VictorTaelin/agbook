module Base.Float.gt where

open import Base.Float.Type
open import Base.Bool.Type
open import Base.Float.lt

gt : Float → Float → Bool
gt x y = lt y x

infix 4 _>_
_>_ : Float → Float → Bool
_>_ = gt
