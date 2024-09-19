module Base.Int.to-bits where

open import Base.Bits.Type
open import Base.Bits.inc
open import Base.Bits.not
open import Base.Int.Type
open import Base.Nat.to-bits renaming (to-bits to nat-to-bits)

to-bits : Int → Bits
to-bits (Pos n) = nat-to-bits n
to-bits (NegSuc n) = inc (not (nat-to-bits n))
