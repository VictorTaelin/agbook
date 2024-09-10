module Data.Bits.decode-utf8 where

open import Data.List.Type
open import Data.List.reverse
open import Data.Char.Type
open import Data.String.Type
open import Data.String.from-list
open import Data.Bits.Type
open import Data.Bits.split-chunks
open import Data.Bits.decode-char-utf8
open import Data.Pair.Type

-- Transforms a list of chars into bits.
{-# TERMINATING #-}
to-char-list : Bits → List Char
to-char-list bits = go (reverse (split-chunks 8 bits)) where
  go : List Bits → List Char
  go [] = []
  go lbits with decode-char-utf8 lbits
  ... | (c , []) = c :: []
  ... | (c , rest) = c :: (go rest)

-- Transforms a UTF-8 encoded string into its Bits representation.
decode-utf8 : Bits → String
decode-utf8 bits = from-list (to-char-list bits)
