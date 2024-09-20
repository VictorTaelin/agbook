module Base.Ordering.eq where

open import Base.Ordering.Type
open import Base.Bool.Type

eq : Ordering → Ordering → Bool
eq LT LT = True
eq EQ EQ = True
eq GT GT = True
eq _  _  = False

infix 4 _==_
_==_ : Ordering → Ordering → Bool
_==_ = eq
