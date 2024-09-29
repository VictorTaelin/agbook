module Base.Bits.neq where

open import Base.Bits.Bits
open import Base.Bool.Bool
open import Base.Bool.not
import Base.Bits.eq as Bits

neq : Bits → Bits → Bool
neq x y = not (Bits.eq x y)

infix 4 _!=_
_!=_ : Bits → Bits → Bool
_!=_ = neq
