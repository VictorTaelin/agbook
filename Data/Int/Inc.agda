module Data.Int.inc where

open import Data.Int.Type
open import Data.Nat.Type

inc : Int → Int
inc (Pos n)           = Pos (Succ n)
inc (NegSuc (Succ n)) = NegSuc n
inc (NegSuc Zero)     = Pos 1




