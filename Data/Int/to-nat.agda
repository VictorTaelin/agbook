module Data.Int.to-nat where

open import Data.Int.Type
open import Data.Nat.Type

to-nat : Int →  Nat
to-nat (Pos n) = n
to-nat (Neg n) = n
