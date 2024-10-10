module Base.Bits.sub where

open import Base.Bits.Bits
open import Base.Bits.show
open import Base.Equal.Equal
open import Base.Bits.to-nat
open import Base.Bits.from-nat

-- Aux function to handle borrowing
-- Adjusts the subtraction when a borrow occurs.
borrow : Bits → Bits
borrow E       = E
borrow (I bs)  = O bs           -- When there is a 1, returns 0 without borrowing
borrow (O bs)  = I (borrow bs)  -- When there is a 0, returns 1 and borrows from the next higher bit

-- Binary subtraction
sub : Bits → Bits → Bits
sub E y = y
sub x E = x
sub (O x) (O y) = O (sub x y)
sub (I x) (O y) = I (sub x y)
sub (O x) (I y) = I (sub (borrow x) y)
sub (I x) (I y) = O (sub x y)

-- Infix operator for Bits subtraction
_-_ : Bits → Bits → Bits
_-_ = sub

infixl 6 _-_

