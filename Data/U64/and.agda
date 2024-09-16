module Data.U64.and where 

open import Data.U64.Type
open import Data.U64.to-bits
open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Bits.and renaming (and to andB; _&&_ to _&&b_)
open import Data.Nat.Type

and : U64 -> U64 -> U64 
and a b = primWord64FromNat (to-nat ((to-bits a) &&b (to-bits b)))



infixl 7 _&&_
_&&_ : U64 → U64 → U64
_&&_ = and
