module Data.Int.dec where

open import Data.Int.Type
open import Data.Nat.Type

dec : Int → Int
dec (Pos Zero)      = NegSuc 1
dec (NegSuc Zero)   = NegSuc 1
dec (NegSuc n)      = NegSuc (Succ n)
dec (Pos (Succ n))  = Pos n
