module Bend.Fun.Num.Num where

open import Base.Nat.Nat
open import Base.Int.Int
open import Base.F64.F64

-- Native numeric types in Bend.
data Num : Set where
  U24 : (val : Nat) → Num
  I24 : (val : Int) → Num
  F24 : (val : F64) → Num
