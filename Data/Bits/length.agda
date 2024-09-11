module Data.Bits.length where

open import Data.Bits.Type
open import Data.Nat.Type

-- Returns the length of a Bits structure, that is, how many bits it has.
length : Bits → Nat
length E        = Zero
length (O bits) = Succ (length bits)
length (I bits) = Succ (length bits)
