module Base.String.hash where

open import Base.Bits.Bits
open import Base.Char.to-nat
open import Base.List.List
open import Base.List.foldl
open import Base.List.map
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.div
open import Base.Nat.exp using () renaming (exp to _exp_)
open import Base.Nat.mod
open import Base.Nat.mul
open import Base.Nat.sub
open import Base.Nat.to-bits
open import Base.Nat.xor using () renaming (xor to _xor_)
open import Base.String.String
open import Base.String.to-list

-- Computes a hash value for a given string using FxHash64 algorithm.
-- - 1st: The input string to be hashed.
-- = A Bits value representing the computed hash of the input string.
hash : String -> Bits
hash str =
  let words = (map to-nat (to-list str)) in
  to-bits (fxhash words)

  where
  
  -- Rotates a number left by a specified number of bits.
  -- - 1st: The number to be rotated.
  -- - 2nd: The number of bits to rotate by.
  -- - 3rd: The total width of the number in bits.
  -- = The rotated number.
  rotate-left : Nat -> Nat -> Nat -> Nat
  rotate-left n shift width =
    let lower = div n (2 exp (width - shift)) in
    let upper = (n * (2 exp shift)) % (2 exp width) in
    (upper + lower)

  -- Performs a single step of the FxHash64 algorithm.
  -- - 1st: The current hash value.
  -- - 2nd: The character (as a Nat) to be incorporated into the hash.
  -- = The updated hash value after processing the character.
  fxhash-step : Nat -> Nat -> Nat
  fxhash-step hash char =
    let seed = 0x517cc1b727220a95 in
    let hash = rotate-left hash 5 64 in
    let hash = hash xor char in
    let hash = hash * seed in
    let hash = hash % (2 exp 64) in
    hash

  -- Applies the FxHash64 algorithm to a list of natural numbers.
  -- - 1st: The list of natural numbers to be hashed.
  -- = The final hash value as a natural number.
  fxhash : List Nat -> Nat
  fxhash ns = foldl fxhash-step 0 ns