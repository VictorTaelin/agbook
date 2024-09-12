module Data.Bits.encode-utf8 where

open import Data.List.Type
open import Data.List.reverse
open import Data.List.map
open import Data.Char.Type
open import Data.Bits.encode-char-utf8
open import Data.String.Type
open import Data.String.to-list
open import Data.Bits.Type
open import Data.Bits.concat

-- Encodes a string into its UTF-8 representation as Bits.
-- - str: The input string to encode.
-- = A Bits value representing the UTF-8 encoding of the entire string.
encode-utf8 : String → Bits
encode-utf8 str = do
  let char-list = to-list str
  let encoded-chars = map encode-char-utf8 char-list
  let reversed = reverse encoded-chars
  concat reversed
