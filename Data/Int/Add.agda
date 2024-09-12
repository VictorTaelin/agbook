module Data.Int.add where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Int.inc
open import Data.Int.dec
open import Data.Int.eq
open import Data.Equal.Type
open import Data.Equal.apply

-- Addition of ints.
-- - m: The 1st int.
-- - n: The 2nd int.
-- = The sum of m and n.
--
add : Int → Int → Int
add (Pos Zero)     (n)            = n
add (Neg Zero)     (n)            = dec n
add (Pos (Succ m)) (n)            = inc (add (Pos m) n)
add (Neg (Succ m)) (n)            = dec (add (Neg m) n)
add (m)            (Pos Zero)     = m
add (m)            (Neg Zero)     = dec m
add (m)            (Pos (Succ n)) = inc (add m (Pos n))
add (m)            (Neg (Succ n)) = dec (add m (Neg n))

_+_ : Int → Int → Int
_+_ = add
