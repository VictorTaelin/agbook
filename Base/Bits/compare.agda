module Base.Bits.compare where

import Base.Bits.eq as Bits
import Base.Bits.lt as Bits
open import Base.Bits.Bits
open import Base.Bool.Bool
open import Base.Ordering.Ordering

-- Comparison of bits.
-- - x: The 1st Bits value.
-- - y: The 2nd Bits value.
-- = The result of comparing x and y, returning an Ordering:
--   - EQ if x is equal to y.
--   - LT if x is less than y.
--   - GT if x is greater than y.
compare : Bits → Bits → Ordering
compare x y with Bits.eq x y | Bits.lt x y
... | True  | _     = EQ
... | False | True  = LT
... | False | False = GT

