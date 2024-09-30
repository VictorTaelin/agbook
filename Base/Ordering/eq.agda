module Base.Ordering.eq where

open import Base.Ordering.Ordering
open import Base.Bool.Bool

eq : Ordering → Ordering → Bool
eq LT LT = True
eq EQ EQ = True
eq GT GT = True
eq _  _  = False

infix 4 _==_
_==_ : Ordering → Ordering → Bool
_==_ = eq
