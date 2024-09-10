module Bend.Fun.Num.Type where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Float.Type

data Num : Set where
  U24 : Nat → Num
  I24 : Int → Num
  F24 : Float → Num
