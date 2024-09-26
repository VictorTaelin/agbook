module Base.Bits.pred where

open import Base.Bits.Bits

-- Decrements a binary string by one, potentially reducing its size.
-- - bs: The input binary string.
-- = The decremented binary string, with leading zeros removed.
pred : Bits -> Bits
pred E      = E
pred (O E)  = E
pred (O bs) = I (pred bs)
pred (I bs) = O bs

-- Examples:
-- pred E             = E       (0 -> 0)
-- pred (I E)         = O E     (1 -> 0)
-- pred (O (I E))     = I E     (10 -> 1)
-- pred (I (I E))     = O (I E) (11 -> 10)
-- pred (O (O (I E))) = I (I E) (100 -> 11)
