module Base.ByteString.drop where

import Base.List.drop as List
open import Base.ByteString.Type
open import Base.ByteString.pack
open import Base.ByteString.unpack
open import Base.Nat.Type

-- Drops the first n bytes from a ByteString.
-- - n: The number of bytes to drop.
-- - bs: The input ByteString.
-- = A new ByteString with the first n bytes removed.
drop : ByteString -> Nat -> ByteString
drop bs n = pack (List.drop n (unpack bs))

