module Base.ByteString.read-char where

open import Base.ByteString.ByteString
open import Base.ByteString.slice
open import Base.ByteString.unpack
open import Base.Char.Char
open import Base.Char.from-nat
open import Base.List.head
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Word8.to-nat

-- Reads a character from a ByteString at the specified position.
-- - bs: The input ByteString.
-- - pos: The position from which to read the character.
-- = The character at the specified position, or None if the position is out of bounds.
read-char : ByteString → Nat → Maybe Char
read-char bs pos with head (unpack (slice bs pos (Succ pos)))
... | None    = None
... | Some n  = Some (from-nat (to-nat n))
