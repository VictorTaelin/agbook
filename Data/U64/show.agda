module Data.U64.show where

open import Data.U64.Type
open import Data.Nat.Type
open import Data.String.Type
open import Data.Nat.show

showU64U : U64 → String

showU64U x = show (primWord64ToNat x) ++ "U"