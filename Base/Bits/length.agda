module Base.Bits.length where

open import Base.Bits.Type
open import Base.Nat.Type

-- Returns the length of a Bits structure, that is, how many bits it has.
length : Bits -> Nat
length E        = Zero
length (O bits) = Succ (length bits)
length (I bits) = Succ (length bits)
