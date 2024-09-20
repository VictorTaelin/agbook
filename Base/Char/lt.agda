module Base.Char.lt where

open import Base.Char.Type
open import Base.Bool.Type
open import Base.Char.to-nat
import Base.Nat.lt as Nat

lt : Char → Char → Bool
lt x y = Nat.lt (to-nat x) (to-nat y)
