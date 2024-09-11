module Data.Bits.concat where

open import Data.List.Type
open import Data.List.reverse
open import Data.Bits.Type

-- Converts a list of Bits in to a single Bits.
-- Least significant bits should be to the left of the list.
concat : List Bits → Bits
concat []             = E
concat (E :: xs)      = concat xs
concat (O bits :: xs) = O (concat (bits :: xs))
concat (I bits :: xs) = I (concat (bits :: xs))
