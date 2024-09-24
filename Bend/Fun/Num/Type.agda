module Bend.Fun.Num.Type where

open import Base.Nat.Type
open import Base.Int.Type
open import Base.Float.Type

-- Native numeric types in Bend.
data Num : Set where
  U24 : (val : Nat) -> Num
  I24 : (val : Int) -> Num
  F24 : (val : Float) -> Num
