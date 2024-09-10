module Data.Int.Add where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Int.inc
open import Data.Int.dec

-- Addition of ints.
-- - m: The 1st int.
-- - n: The 2nd int.
-- = The sum of m and n.
--
add : Int → Int → Int
add m (Pos (Succ n))      = inc (add m (Pos n))
add m (NegSuc (Succ n))   = dec (add m (NegSuc n))
add m (Pos Zero)          = m
add m (NegSuc Zero)       = m
