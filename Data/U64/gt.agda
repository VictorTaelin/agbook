module Data.U64.gt where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.gt renaming (_>_ to _n>_; gt to ngt)

gt : U64 → U64 → Bool
gt x y = primWord64ToNat x n> primWord64ToNat y

infix 5 _>_
_>_ : U64 → U64 → Bool
_>_ = gt
