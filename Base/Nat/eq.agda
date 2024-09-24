module Base.Nat.eq where

open import Base.Nat.Type
open import Base.Bool.Type

eq : Nat -> Nat -> Bool
eq Zero     Zero     = True
eq (Succ m) (Succ n) = eq m n
eq _        _        = False

infix 4 _==_
_==_ : Nat -> Nat -> Bool
_==_ = eq
