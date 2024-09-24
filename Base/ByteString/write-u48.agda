module Base.ByteString.write-u48 where

import Base.Word8.from-nat as Word8
open import Base.Bits.Type
open import Base.Bits.pad-zeros
open import Base.Bits.split-chunks
open import Base.Bits.to-nat
open import Base.ByteString.Type
open import Base.ByteString.pack
open import Base.ByteString.unpack
open import Base.List.Type
open import Base.List.append
open import Base.List.drop
open import Base.List.map
open import Base.List.take
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Nat.to-bits
open import Base.Word8.Type

-- Writes a 48-bit unsigned integer to a ByteString at a specified position.
-- - bs: The original ByteString to modify.
-- - pos: The position (in bytes) where the 48-bit value should be written.
-- - value: The 48-bit unsigned integer to write (as a Nat).
-- = A new ByteString with the 48-bit value written at the specified position.
write-u48 : ByteString -> Nat -> Nat -> ByteString
write-u48 bs pos value = do
  let original = unpack bs
  let bits = pad-zeros 48 (to-bits value)
  let chunks = split-chunks 8 bits
  let bytes = map (λ x → Word8.from-nat (to-nat x)) chunks
  let before = take pos original
  let after = drop (pos + 6) original
  let result = pack (before ++ bytes ++ after)
  result
