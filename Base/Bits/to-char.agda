module Base.Bits.to-char where

import Base.Bits.to-nat as B
import Base.Char.from-nat as C
open import Base.Bits.Type
open import Base.Bits.pad-zeros
open import Base.Char.Type

to-char : Bits -> Char
to-char bits = C.from-nat (B.to-nat bits)
