module Base.Ordering.neq where

open import Base.Ordering.Type
open import Base.Bool.Type

neq : Ordering → Ordering → Bool
neq LT LT = False
neq EQ EQ = False
neq GT GT = False
neq _  _  = True

infix 4 _!=_
_!=_ : Ordering → Ordering → Bool
_!=_ = neq
