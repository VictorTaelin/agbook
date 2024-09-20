module Base.U64.to-nat where

open import Base.U64.Type
open import Base.Nat.Type

primitive
  primWord64ToNat : U64 → Nat

to-nat : U64 → Nat
to-nat = primWord64ToNat
