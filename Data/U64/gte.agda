module Data.U64.gte where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.Type

gte : U64 → U64 → Bool
gte x y = helper (primWord64ToNat x) (primWord64ToNat y)
  where
    helper : Nat → Nat → Bool
    helper Zero     Zero     = True
    helper Zero     (Succ _) = False
    helper (Succ _) Zero     = True
    helper (Succ m) (Succ n) = helper m n

infix 4 _>=_

_>=_ : U64 → U64 → Bool
_>=_ = gte