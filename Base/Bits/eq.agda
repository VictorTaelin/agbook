module Base.Bits.eq where

open import Base.Bits.Type
open import Base.Bool.Type

eq : Bits → Bits → Bool
eq E E = True
eq (O x) (O y) = eq x y
eq (I x) (I y) = eq x y
eq _ _ = False


infix 4 _==_
_==_ : Bits → Bits → Bool
_==_ = eq
