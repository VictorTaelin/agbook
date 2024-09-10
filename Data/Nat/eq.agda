module Data.Nat.eq where

open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Equal.Type
open import Data.Class.Eq

instance
  EqNat : Eq Nat
  EqNat = record
    { _≡_ = eq-nat
    ; _≠_ = neq-nat
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

-- Testes
_ : (3 == 3) === True
_ = refl

_ : (2 == 3) === False
_ = refl

_ : (4 != 4) === False
_ = refl
