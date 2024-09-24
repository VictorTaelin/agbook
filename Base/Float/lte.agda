module Base.Float.lte where

open import Base.Float.Type
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Float.lt

lte : Float -> Float -> Bool
lte x y = not (lt y x)

infix 4 _<=_
_<=_ : Float -> Float -> Bool
_<=_ = lte
