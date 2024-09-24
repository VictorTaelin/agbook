module Bend.Compile.BendToNet.Encoder.encode-num where

open import Base.Bits.Type
open import Base.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Base.Int.to-bits renaming (to-bits to int-to-bits)
open import Base.F64.to-bits renaming (to-bits to float-to-bits)
open import Bend.Fun.Num.Type using (Num)

-- Encodes a Num (number) into its HVM bit representation
-- - num: The Num to be encoded
-- = The Bits representation of the number
-- TODO: This is temporary and we should instead use the HVM conversions
encode-num : Num -> Bits
encode-num (Num.U24 n) = nat-to-bits n
encode-num (Num.I24 n) = int-to-bits n
encode-num (Num.F24 n) = float-to-bits n
