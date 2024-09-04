module Data.String.replicate where

open import Data.Nat.Type
open import Data.Char.Type
open import Data.String.Type
open import Data.String.from-char
open import Data.String.append

-- Replicates a character n times to create a string.
-- - n: The number of times to replicate the character.
-- - c: The character to replicate.
-- = A string consisting of n repetitions of c.
replicate : Nat → Char → String
replicate Zero _ = ""
replicate (Succ n) c = append (from-char c) (replicate n c)
