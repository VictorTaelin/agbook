module Data.Word8.from-bits where

open import Data.Word8.Type
open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Word8.from-nat

-- Converts a Bits value to its corresponding Word8 representation.
-- - bits: The Bits value to convert.
-- = The Word8 representation of the Bits value.
from-bits : Bits → Word8
from-bits bits = from-nat (to-nat bits)
