module Base.U64.mul where

open import Base.U64.Type
open import Base.Nat.mul renaming (_*_ to _n*_; mul to nmul)
open import Base.U64.to-nat
open import Base.U64.from-nat

-- Multiplies two U64 values.
-- - a: The first U64 to multiply.
-- - b: The second U64 to multiply.
-- = The result of a * b, potentially wrapping around due to 64-bit limitation.
mul : U64 → U64 → U64
mul a b = from-nat (to-nat a n* to-nat b)

infixl 8 _*_
_*_ : U64 → U64 → U64
_*_ = mul
