module Data.Bits.strip where

open import Data.Bits.Type
open import Data.Function.case using (case_of_)

-- Removes trailing zeros from a Bits representation
strip : Bits → Bits
strip E = E
strip (I bits) = I (strip bits)
strip (O bits) = case strip bits of λ
  { E → E
  ; stripped → O stripped
  }
