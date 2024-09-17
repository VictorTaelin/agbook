module Data.Nat.eq where

open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Trait.Eq
open import Data.Trait.Eq public

instance
  EqNat : Eq Nat
  EqNat = record
    { eq = eq-nat
    ; neq = neq-nat
    }
    where
      eq-nat : Nat → Nat → Bool
      eq-nat Zero     Zero     = True
      eq-nat (Succ m) (Succ n) = eq-nat m n
      eq-nat _        _        = False

      neq-nat : Nat → Nat → Bool
      neq-nat Zero     (Succ _) = True
      neq-nat (Succ _) Zero     = True
      neq-nat Zero     Zero     = False
      neq-nat (Succ m) (Succ n) = neq-nat m n

