module Base.ByteString.slice where

open import Base.ByteString.ByteString
open import Base.ByteString.pack
open import Base.ByteString.unpack
open import Base.List.drop
open import Base.List.take
open import Base.Nat.Nat
open import Base.Nat.sub

-- Extracts a portion of a ByteString.
-- - bs: The input ByteString.
-- - init: The starting index of the slice.
-- - end: The ending index of the slice (exclusive).
-- = A new ByteString containing the specified slice.
slice : ByteString → Nat → Nat → ByteString
slice bs init end = pack (take (end - init) (drop init (unpack bs)))
