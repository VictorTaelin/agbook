module Data.Int.not where

open import Data.Int.Type
open import Data.Nat.Type

not : Int → Int
not (Pos Zero) = Pos Zero
not (Pos (Succ n)) = Neg n
not (Neg n) = Pos (Succ n)
