module Base.U64.show where

open import Base.U64.Type
open import Base.String.Type
open import Base.String.append
import Base.Nat.show as Nat

show : U64 → String
show x = Nat.show (primWord64ToNat x) ++ "U"
