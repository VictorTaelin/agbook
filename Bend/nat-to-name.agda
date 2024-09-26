module Bend.nat-to-name where

open import Base.Char.Char
open import Base.Char.from-nat
open import Base.Char.to-nat
open import Base.List.List
open import Base.List.map
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.sub
open import Base.Nat.div
open import Base.Nat.mod
open import Base.String.String
open import Base.String.from-list


{-# TERMINATING #-}
-- Converts a natural number into a unique name.
-- - n: The number to convert.
-- = A unique string representation of the number, using only lowercase ascii characters.
nat-to-name : Nat -> String
nat-to-name n = from-list (letter-list n)

  where

  letter : Nat -> Char
  letter n = from-nat (n + (to-nat 'a'))

  letter-list' : Nat -> List Char -> List Char
  letter-list' 0 acc = acc
  letter-list' (Succ n) acc = letter-list' (div n 26) (letter (n % 26) :: acc)

  letter-list : Nat -> List Char
  letter-list n = letter-list' (div n 26) (letter (n % 26) :: [])
