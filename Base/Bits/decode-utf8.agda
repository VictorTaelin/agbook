module Base.Bits.decode-utf8 where

open import Base.Bits.Type
open import Base.Bits.Decode-utf8.decode-utf8-go
open import Base.Bits.reverse
open import Base.Bits.split-chunks
open import Base.String.Type
open import Base.String.from-list

-- Decodes a UTF-8 encoded Bits representation into a String.
-- - bits: The input Bits representing a UTF-8 encoded string.
-- = The decoded String.
decode-utf8 : Bits -> String
decode-utf8 bits = from-list (decode-utf8-go (split-chunks 8 (reverse bits)))
