module Data.Bits.dec where

open import Data.Bits.Type

all-ones : Bits → Bits
all-ones E = E
all-ones (O bs) = I (all-ones bs)
all-ones (I bs) = I (all-ones bs)

-- Decrements a binary string by one.
-- - bs: The input binary string.
-- = The decremented binary string.
dec : Bits → Bits
dec E = all-ones E  -- Decrementing 0 (empty) wraps around to all ones
dec (O E) = I E     -- Special case: 0 becomes 1
dec (I E) = O E     -- 1 becomes 0
dec (O bs) = I (dec bs)
dec (I bs) = O bs
