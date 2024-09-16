module Bend.Fun.Num.Type where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Float.Type

-- Native numeric types in Bend.
data Num : Set where
  U24 : (val : Nat) → Num
  I24 : (val : Int) → Num
  F24 : (val : Float) → Num
