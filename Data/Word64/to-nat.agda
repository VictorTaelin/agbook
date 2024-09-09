module Data.Word64.to-nat where

open import Data.Nat.Type
open import Data.Word64.Type

to-nat : Word64 → Nat
to-nat = primWord64ToNat
