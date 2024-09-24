module Base.Bits.lte where

open import Base.Bits.Type
open import Base.Bool.Type
open import Base.Bits.lt
open import Base.Bool.not

lte : Bits -> Bits -> Bool
lte a b = not (lt b a)

infix 4 _<=_
_<=_ : Bits -> Bits -> Bool
_<=_ = lte
