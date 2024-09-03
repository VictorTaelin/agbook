module Data.Bits.from-string where

open import Data.List.Type
open import Data.List.map
open import Data.List.reverse
open import Data.Char.Type
open import Data.String.Type
open import Data.String.to-list
open import Data.Bits.Type
open import Data.Bits.from-char
open import Data.Bits.concat

-- Transforms a list of chars into bits.
from-char-list : List Char → Bits
from-char-list char-list = concat (reverse (map from-char char-list))

-- Transforms a UTF-8 encoded string into its Bits representation.
from-string : String → Bits
from-string str = from-char-list (to-list str)
