module Data.Int.neg where

open import Data.Int.Type
open import Data.Nat.Type


neg : Int → Int
neg (Pos Zero) = Pos Zero
neg (Pos (Succ n)) = Neg n
neg (Neg n) = Pos (Succ n)
