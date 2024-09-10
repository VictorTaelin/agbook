module Data.Bits.encode-utf8 where

open import Data.List.Type
open import Data.List.concat-map
open import Data.List.reverse
open import Data.Char.Type
open import Data.Bits.encode-char-utf8
open import Data.String.Type
open import Data.String.to-list
open import Data.Bits.Type
open import Data.Bits.from-char
open import Data.Bits.concat

-- Transforms a list of chars into bits.
from-char-list : List Char → Bits
from-char-list char-list = concat (reverse (concat-map encode-char-utf8 char-list))

-- Transforms a UTF-8 encoded string into its Bits representation.
encode-utf8 : String → Bits
encode-utf8 str = from-char-list (to-list str)
