module Base.Nat.div where

open import Base.Bool.if
open import Base.Nat.Nat
open import Base.Nat.div.go

-- Integer division of nats.
-- - m: The dividend.
-- - n: The divisor.
-- = The quotient of m divided by n.
div : Nat → Nat → Nat
div m Zero     = Zero  -- Division by zero returns zero.
div m (Succ n) = go Zero n m n

_/_ : Nat → Nat → Nat
_/_ = div

infixl 7 _/_
