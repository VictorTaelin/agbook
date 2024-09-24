module Base.Float.gte where

open import Base.Float.Type
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Float.lt

gte : Float -> Float -> Bool
gte x y = not (lt x y)

infix 4 _>=_
_>=_ : Float -> Float -> Bool
_>=_ = gte
