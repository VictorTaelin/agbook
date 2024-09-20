module Base.Bits.inc where

open import Base.Bits.Type

-- Increments a Bits value by 1.
-- - b: The input Bits value.
-- = A new Bits value representing b + 1.
inc : Bits → Bits
inc E     = I E
inc (O b) = I b
inc (I b) = O (inc b)