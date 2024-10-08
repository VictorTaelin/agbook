module Base.String.to-bits where

import Base.Char.to-nat as Char
import Base.Nat.to-bits as Nat
open import Base.Bits.Bits
open import Base.Bits.concat
open import Base.Bits.pad-zeros
open import Base.Char.Char
open import Base.List.List
open import Base.List.map
open import Base.Nat.Nat
open import Base.String.String
open import Base.String.to-list

-- Converts a string to its binary representation with padded char bits.
-- - s: The input string.
-- = The binary representation of the string as Bits, with each char
--   represented by exactly 21 bits.
to-bits : String → Bits
to-bits s = concat (map (λ x → pad-zeros 21 (Nat.to-bits (Char.to-nat x))) (to-list s))
