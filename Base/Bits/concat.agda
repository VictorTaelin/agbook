module Base.Bits.concat where

open import Base.Bits.Bits
open import Base.List.List

-- Concatenation of a list of Bits into a single Bits value.
-- - xs: The list of Bits to concatenate.
-- - The least significant bits are positioned to the left of the list.
-- = The result is a single Bits value.
concat : List Bits -> Bits
concat []             = E
concat (E :: xs)      = concat xs
concat (O bits :: xs) = O (concat (bits :: xs))
concat (I bits :: xs) = I (concat (bits :: xs))
