module HVM.Addr.Addr where

open import Base.Bits.Bits
open import Base.Nat.Nat
open import Base.Bool.Bool

data Addr : Set where
  Root : (path : Bits) → Addr
  RBag : (idx : Nat) → (side : Bool) → (path : Bits) → Addr

