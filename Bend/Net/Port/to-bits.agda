module Bend.Net.Port.to-bits where

open import Base.Bits.Bits
open import Base.Bits.pad-zeros
open import Base.Bits.append
open import Base.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Bend.Net.Port.Port

to-bits : Port → Bits
-- We need to pad to make sure that the bit representation is unique.
-- The padding should ensure at least the max hvm width.
to-bits (MkPort node-id slot-id) = nat-to-bits node-id ++ pad-zeros 32 (nat-to-bits slot-id)
