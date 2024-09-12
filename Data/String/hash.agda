module Data.String.hash where

open import Data.Bits.Type
open import Data.Char.to-nat
open import Data.String.Type
open import Data.String.to-list
open import Data.List.Type
open import Data.List.map
open import Data.List.foldl
open import Data.Nat.Type
open import Data.Nat.to-bits
open import Data.Nat.xor using () renaming (xor to _xor_)
open import Data.Nat.exp using () renaming (exp to _exp_)
open import Data.Nat.mul
open import Data.Nat.div
open import Data.Nat.mod
open import Data.Nat.sub
open import Data.Nat.add

-- FxHash64
-- Note: Chars are only actually 21 bits long, so maybe this is bad.
hash : String → Bits
hash str =
  let words = (map to-nat (to-list str)) in
  to-bits (fxhash words)

  where
  
  rotate-left : Nat → Nat → Nat → Nat
  rotate-left n shift width =
    let lower = div n (2 exp (width - shift)) in
    let upper = (n * (2 exp shift)) % (2 exp width) in
    (upper + lower)

  fxhash-step : Nat → Nat → Nat
  fxhash-step hash char =
    let seed = 0x517cc1b727220a95 in
    let hash = rotate-left hash 5 64 in
    let hash = hash xor char in
    let hash = hash * seed in
    let hash = hash % (2 exp 64) in
    hash

  fxhash : List Nat → Nat
  fxhash ns = foldl fxhash-step 0 ns
