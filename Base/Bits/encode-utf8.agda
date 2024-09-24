module Base.Bits.encode-utf8 where

open import Base.List.Type
open import Base.List.reverse
open import Base.List.map
open import Base.Char.Type
open import Base.Bits.encode-char-utf8
open import Base.String.Type
open import Base.String.to-list
open import Base.Bits.Type
open import Base.Bits.concat

-- Encodes a string into its UTF-8 representation as Bits.
-- - str: The input string to encode.
-- = A Bits value representing the UTF-8 encoding of the entire string.
encode-utf8 : String -> Bits
encode-utf8 str = do
  let char-list = to-list str
  let encoded-chars = map encode-char-utf8 char-list
  let reversed = reverse encoded-chars
  concat reversed
