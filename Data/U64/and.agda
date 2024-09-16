module Data.U64.and where 

open import Data.U64.Type
open import Data.U64.from-nat
open import Data.Bits.Type
open import Data.Bits.from-nat renaming (from-nat to bits-from-nat)
open import Data.Bits.and renaming (and to andN)
open import Data.Nat.Type

and : U64 → U64 → Bits 
and a b = (bits-from-nat (primWord64ToNat a)) && (bits-from-nat (primWord64ToNat b))

infixl 7 _&_
_&_ : U64 → U64 → Bits
_&_ = and
