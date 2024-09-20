module Base.Unit.neq where

open import Base.Unit.Type
open import Base.Bool.Type

neq : Unit → Unit → Bool
neq _ _ = False

infix 4 _!=_
_!=_ : Unit → Unit → Bool
_!=_ = neq
