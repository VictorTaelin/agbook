module Base.U64.show where

open import Base.U64.Type
open import Base.String.Type
open import Base.String.append
import Base.Nat.show as Nat
open import Base.U64.to-nat

show : U64 → String
show x = Nat.show (to-nat x) ++ "U"
