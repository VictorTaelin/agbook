module Data.U64.or where 

open import Data.U64.Type
open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Bits.or renaming (or to orB; _||_ to _||b_)
open import Data.Nat.Type
open import Data.U64.to-bits

or : U64 -> U64 -> U64 
or a b = primWord64FromNat (to-nat ((to-bits a) ||b (to-bits b)))

_||_ : U64 -> U64 -> U64
_||_ = or
