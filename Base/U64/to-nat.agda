module Base.U64.to-nat where

open import Base.U64.U64
open import Base.Nat.Nat

primitive
  primWord64ToNat : U64 → Nat

to-nat : U64 → Nat
to-nat = primWord64ToNat

