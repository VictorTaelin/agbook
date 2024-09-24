module Base.Char.lte where

open import Base.Char.Type
open import Base.Bool.Type
open import Base.Char.to-nat
import Base.Nat.lte as Nat

lte : Char -> Char -> Bool
lte x y = Nat.lte (to-nat x) (to-nat y)

infix 4 _<=_
_<=_ : Char -> Char -> Bool
_<=_ = lte
