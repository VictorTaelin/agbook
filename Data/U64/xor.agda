module Data.U64.xor where 

open import Data.U64.Type
open import Data.U64.from-nat
open import Data.Bits.Type
open import Data.Bits.from-nat renaming (from-nat to bits-from-nat)
open import Data.Bits.xor renaming (xor to xorB; _^_ to _^b_ )
open import Data.Nat.Type

xor : U64 -> U64 -> Bits 
xor a b = (bits-from-nat (primWord64ToNat a)) ^b (bits-from-nat (primWord64ToNat b))

infixl 6 _^_
_^_ : U64 -> U64 -> Bits
_^_ = xor