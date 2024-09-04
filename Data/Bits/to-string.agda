module Data.Bits.to-string where

open import Data.List.Type
open import Data.List.map
open import Data.List.reverse
open import Data.Char.Type
open import Data.String.Type
open import Data.String.from-list
open import Data.Bits.Type
open import Data.Bits.to-char
open import Data.Bits.split-chunks

to-char-list : Bits → List Char
to-char-list bits = map to-char (reverse (split-chunks 8 bits))

-- Transforms a Bits structure into its UTF-8 encoded string.
to-string : Bits → String
to-string bits = from-list (to-char-list bits)
