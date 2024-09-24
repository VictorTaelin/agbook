module Base.Bits.reverse where

open import Base.Bits.Type

-- Reverses the order of bits in a binary string.
-- - bits: The input binary string.
-- = The reversed binary string.
reverse : Bits -> Bits
reverse = go E where
  go : Bits -> Bits -> Bits
  go acc E        = acc
  go acc (O bits) = go (O acc) bits
  go acc (I bits) = go (I acc) bits

