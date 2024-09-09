module Data.Word8.to-bits where

open import Data.Word8.Type
open import Data.Bits.Type
open import Data.Word8.to-nat as W
import Data.Nat.to-bits as N

-- Converts a Word8 to its binary representation as Bits.
-- - w: The Word8 to convert.
-- = The binary representation of the Word8 as Bits.
to-bits : Word8 → Bits
to-bits w = N.to-bits (W.to-nat w)
