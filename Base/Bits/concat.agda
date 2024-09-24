module Base.Bits.concat where

open import Base.List.Type
open import Base.Bits.Type

-- Converts a list of Bits in to a single Bits.
-- Least significant bits should be to the left of the list.
concat : List Bits -> Bits
concat []             = E
concat (E :: xs)      = concat xs
concat (O bits :: xs) = O (concat (bits :: xs))
concat (I bits :: xs) = I (concat (bits :: xs))
