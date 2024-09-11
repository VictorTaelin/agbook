module Data.U64.gt where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.gt using (_>_)

gtU64 : U64 → U64 → Bool
gtU64 x y = primWord64ToNat x > primWord64ToNat y
