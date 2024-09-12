module Data.Int.inc where

open import Data.Int.Type
open import Data.Nat.Type

inc : Int → Int
inc (Neg Zero)     = Pos Zero
inc (Pos n)        = Pos (Succ n)
inc (Neg (Succ n)) = Neg n


