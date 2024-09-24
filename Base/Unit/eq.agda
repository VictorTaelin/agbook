module Base.Unit.eq where

open import Base.Unit.Type
open import Base.Bool.Type

eq : Unit -> Unit -> Bool
eq _ _ = True

infix 4 _==_
_==_ : Unit -> Unit -> Bool
_==_ = eq
