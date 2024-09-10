module Data.Int.inc where

open import Data.Int.Type
open import Data.Nat.Type

inc : Int → Int
inc (NegSuc Zero)     = Pos 1
inc (NegSuc 1)        = Pos Zero
inc (Pos n)           = Pos (Succ n)
inc (NegSuc (Succ n)) = NegSuc n
