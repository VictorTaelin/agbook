module Data.Int.dec where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Equal.apply

dec : Int → Int
dec (Pos Zero)      = Neg 1
dec (Neg n)         = Neg (Succ n)
dec (Pos (Succ n))  = Pos n

