module Data.Bits.with-depth where

open import Data.Bits.Type
open import Data.Nat.Type

-- Pads Bits with zeros to the left (that is, the end of the structure) as to have a specific depth.
with-depth : Nat → Bits → Bits
with-depth Zero bits = bits
with-depth (Succ n) E = O (with-depth n E)
with-depth (Succ n) (O bits) = O (with-depth n bits)
with-depth (Succ n) (I bits) = I (with-depth n bits)
