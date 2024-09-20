module Base.Bits.neq where

open import Base.Bits.Type
open import Base.Bool.Type
open import Base.Bool.not
import Base.Bits.eq as Bits

neq : Bits → Bits → Bool
neq x y = not (Bits.eq x y)
