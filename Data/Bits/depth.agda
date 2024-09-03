module Data.Bits.depth where

open import Data.Bits.Type
open import Data.Nat.Type

-- Returns the depth of a Bits structure, that is, how many bits it has.
depth : Bits → Nat
depth E = Zero
depth (O bits) = Succ (depth bits)
depth (I bits) = Succ (depth bits)
