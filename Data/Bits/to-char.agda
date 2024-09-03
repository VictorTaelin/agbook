module Data.Bits.to-char where

open import Data.Bits.Type
import Data.Bits.to-nat as B
open import Data.Bits.with-depth
open import Data.Char.Type
import Data.Char.from-nat as C

to-char : Bits → Char
to-char bits = C.from-nat (B.to-nat bits)
