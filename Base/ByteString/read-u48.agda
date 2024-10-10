module Base.ByteString.read-u48 where

import Base.Bits.to-nat as Bits
import Base.Word8.to-nat as Word8
open import Base.Bits.concat
open import Base.Bits.normal
open import Base.Bits.pad-zeros
open import Base.ByteString.ByteString
open import Base.ByteString.pack
open import Base.ByteString.unpack
open import Base.List.drop
open import Base.List.map
open import Base.List.take
open import Base.List.reverse
open import Base.Nat.Nat
open import Base.Nat.to-bits

-- Reads a 48-bit unsigned integer from a ByteString at a given position in big-endian order.
-- This function interprets 6 bytes (48 bits) from the ByteString as a single natural number.
-- Note: If there are fewer than 6 bytes available from the given position,
-- the function will still return a result, interpreting whatever bytes are available.
-- - bs: The input ByteString to read from.
-- - pos: The starting position (in bytes) from where to read the 48-bit value.
-- = The natural number representation of the 48-bit value read from the ByteString in big-endian order.
read-u48 : ByteString → Nat → Nat
read-u48 bs pos = do
  let bytes = reverse (take 6 (drop pos (unpack bs)))
  let bits = concat (map (λ x → pad-zeros 8 (normal (to-bits (Word8.to-nat x)))) bytes)
  let truncatedBits = pad-zeros 48 bits
  let result = Bits.to-nat truncatedBits
  result

