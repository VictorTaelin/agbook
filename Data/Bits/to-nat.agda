module Data.Bits.to-nat where

open import Data.Bits.Type
open import Data.Nat.Type
open import Data.Nat.double

-- Transforms bits into their natural number correspondent.
to-nat : Bits → Nat
to-nat E = Zero
to-nat (O bits) = double (to-nat bits)
to-nat (I bits) = Succ (double (to-nat bits))
