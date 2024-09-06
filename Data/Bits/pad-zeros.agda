module Data.Bits.pad-zeros where

open import Data.Bits.Type
open import Data.Nat.Type

-- Pads Bits with insignificant zeroes, as to achieve a specific length.
pad-zeros : Nat → Bits → Bits
pad-zeros Zero bits = bits
pad-zeros (Succ n) E = O (pad-zeros n E)
pad-zeros (Succ n) (O bits) = O (pad-zeros n bits)
pad-zeros (Succ n) (I bits) = I (pad-zeros n bits)
