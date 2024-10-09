module Base.String.replicate where

open import Base.Char.Char
open import Base.Nat.Nat
open import Base.String.String
open import Base.String.append
open import Base.String.from-char

-- Replicates a character n times to create a string.
-- - n: The number of times to replicate the character.
-- - c: The character to replicate.
-- = A string consisting of n repetitions of c.
replicate : Nat → Char → String
replicate Zero _ = ""
replicate (Succ n) c = append (from-char c) (replicate n c)

