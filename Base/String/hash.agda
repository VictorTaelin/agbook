module Base.String.hash where

open import Base.Bits.Type
open import Base.Char.to-nat
open import Base.String.Type
open import Base.String.to-list
open import Base.List.Type
open import Base.List.map
open import Base.List.foldl
open import Base.Nat.Type
open import Base.Nat.to-bits
open import Base.Nat.xor
open import Base.Nat.mul
open import Base.Nat.div
open import Base.Nat.mod
open import Base.Nat.sub
open import Base.Nat.add

-- FxHash64
-- Note: Chars are only actually 21 bits long, so maybe this is bad.
hash : String → Bits
hash str =
  let words = (map to-nat (to-list str)) in
  to-bits (fxhash words)

  where
  
  rotate-left : Nat → Nat → Nat → Nat
  rotate-left n shift width =
    let lower = div n (2 ^ (width - shift)) in
    let upper = (n * (2 ^ shift) % (2 ^ width)) in
    (upper + lower)

  fxhash-step : Nat → Nat → Nat
  fxhash-step hash char =
    let seed = 0x517cc1b727220a95 in
    let hash = rotate-left hash 5 64 in
    let hash = hash ^ char in
    let hash = hash * seed in
    let hash = hash % (2 ^ 64) in
    hash

  fxhash : List Nat → Nat
  fxhash = foldl fxhash-step 0
