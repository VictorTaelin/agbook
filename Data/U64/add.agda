module Data.U64.add where

open import Data.Nat.add renaming (_+_ to _n+_; add to addN)
open import Data.U64.Type

add : U64 → U64 → U64
add a b = primWord64FromNat (primWord64ToNat a n+ primWord64ToNat b)

infixl 6 _+_
_+_ : U64 → U64 → U64
_+_ = add
