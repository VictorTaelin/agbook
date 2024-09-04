-- module Data.Int.Type where
--
-- open import Data.Nat.Type
-- open import Data.String.Type
--
-- data Int : Set where
--   Pos    : Nat → Int
--   NegSuc : Nat → Int
--
-- {-# BUILTIN INTEGER       Int    #-}
-- {-# BUILTIN INTEGERPOS    Pos    #-}
-- {-# BUILTIN INTEGERNEGSUC NegSuc #-}
--
-- primitive
--   primShowInteger : Int → String


-- module Data.Int.dec where
--
-- open import Data.Int.Type
-- open import Data.Nat.Type
--
-- dec : Int → Int
-- dec (Pos Zero)      = NegSuc 1
-- dec (Pos (Succ n))  = Pos n
-- dec (NegSuc n)      = NegSuc (Succ n)

-- module Data.Int.inc where
--
-- open import Data.Int.Type
-- open import Data.Nat.Type
--
-- inc : Int → Int
-- inc (Pos n) = Pos (Succ n)
-- inc (NegSuc (Succ n)) = NegSuc n
-- inc (NegSuc Zero) = Pos 1
--






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
add m (Pos Zero)      = m
add m (Pos (Succ n))  = inc (add m (Pos n))
add m (NegSuc n)      = dec (add m (NegSuc n))



main = add (Pos 4) (NegSuc 3)
