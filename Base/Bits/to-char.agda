module Base.Bits.to-char where

open import Base.Bits.Type
import Base.Bits.to-nat as B
open import Base.Bits.pad-zeros
open import Base.Char.Type
import Base.Char.from-nat as C

to-char : Bits → Char
to-char bits = C.from-nat (B.to-nat bits)
