module Base.Bits.succ where

open import Base.Bits.Bits

-- Increments a binary string by one, increasing its size if necessary.
-- - bs: The input binary string.
-- = The incremented binary string, with an additional bit if needed.
succ : Bits → Bits
succ E      = I E
succ (O bs) = I bs
succ (I bs) = O (succ bs)

-- Examples:
-- succ E         = I E         (0 → 1)
-- succ (O E)     = I E         (0 → 1)
-- succ (I E)     = O (I E)     (1 → 10)
-- succ (I (I E)) = O (O (I E)) (11 → 100)
