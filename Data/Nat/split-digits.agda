module Data.Nat.split-digits where

open import Data.Nat.Type
open import Data.Nat.div
open import Data.Nat.mod
open import Data.Nat.is-zero
open import Data.List.Type
open import Data.Bool.Type
open import Data.Bool.if

split-digits-helper : Nat -> List Nat -> List Nat
split-digits-helper n acc =
  let digit = mod n 10
      rest = div n 10
  in if is-zero rest
     then digit :: acc
     else split-digits-helper rest (digit :: acc)

split-digits : Nat -> List Nat
split-digits n = split-digits-helper n []
