module Bend.Compile.BendToNet.Encoder.encode-num where

open import Data.Bits.Type
open import Data.Nat.to-bits renaming (to-bits to nat-to-bits)
open import Data.Int.to-bits renaming (to-bits to int-to-bits)
open import Data.Float.to-bits renaming (to-bits to float-to-bits)
open import Bend.Fun.Num.Type using (Num)

-- TODO: This is temporary and we should instead use the HVM conversions
encode-num : Num → Bits
encode-num (Num.U24 n) = nat-to-bits n
encode-num (Num.I24 n) = int-to-bits n
encode-num (Num.F24 n) = float-to-bits n
