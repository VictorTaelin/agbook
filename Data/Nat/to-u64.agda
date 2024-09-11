module Data.Nat.to-u64 where

open import Data.Nat.Type
open import Data.U64.Type

to-u64 : Nat → U64
to-u64 = primWord64FromNat
