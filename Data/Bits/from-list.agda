module Data.Bits.from-list where

open import Data.List.Type
open import Data.List.reverse
open import Data.Bits.Type

-- Converts a list of Bits in to a single Bits.
-- Least significant bits should be to the left of the list.
from-list : List Bits → Bits
from-list [] = E
from-list (E :: xs) = from-list xs
from-list (O bits :: xs) = O (from-list (bits :: xs))
from-list (I bits :: xs) = I (from-list (bits :: xs))
