module Base.U64.sub where

open import Base.U64.Type
open import Base.Nat.sub renaming (_-_ to _n-_; sub to nsub)
open import Base.Nat.add
open import Base.U64.to-nat
open import Base.U64.from-nat

-- Subtracts one U64 from another.
-- - a: The U64 to subtract from.
-- - b: The U64 to subtract.
-- = The result of a - b, wrapping around if b > a.
sub : U64 -> U64 -> U64
sub a b = from-nat ((to-nat a + 18446744073709551616) n- to-nat b)

infixl 6 _-_
_-_ : U64 -> U64 -> U64
_-_ = sub
