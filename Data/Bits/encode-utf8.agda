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

-- Transforms a UTF-8 encoded string into its Bits representation.
encode-utf8 : String → Bits
encode-utf8 str = do
  let char-list = to-list str
  let encoded-chars = map encode-char-utf8 char-list
  let reversed = reverse encoded-chars
  concat reversed
