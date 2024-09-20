module Base.Nat.neq where

open import Base.Nat.Type
open import Base.Bool.Type

neq : Nat → Nat → Bool
neq Zero     (Succ _) = True
neq (Succ _) Zero     = True
neq Zero     Zero     = False
neq (Succ m) (Succ n) = neq m n

infix 4 _!=_
_!=_ : Nat → Nat → Bool
_!=_ = neq
