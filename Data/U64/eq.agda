module Data.U64.eq where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.eq renaming (_==_ to _n==_; eq to natEq)

eq : U64 → U64 → Bool
eq x y = (primWord64ToNat x) n== (primWord64ToNat y)

infix 4 _==_
_==_ : U64 → U64 → Bool
_==_ = eq
