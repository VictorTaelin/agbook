module Base.Char.Ord where

open import Base.Char.Type
open import Base.Char.to-nat
open import Base.Nat.Type
open import Base.Nat.Ord
open import Base.Bool.Type
open import Base.Trait.Ord

instance
  OrdChar : Ord Char
  OrdChar = record
    { compare = λ x y → compare {{OrdNat}} (to-nat x) (to-nat y)
    ; _<_     = λ x y →    _<_  {{OrdNat}} (to-nat x) (to-nat y)
    ; _<=_    = λ x y →    _<=_ {{OrdNat}} (to-nat x) (to-nat y)
    ; _>_     = λ x y →    _>_  {{OrdNat}} (to-nat x) (to-nat y)
    ; _>=_    = λ x y →    _>=_ {{OrdNat}} (to-nat x) (to-nat y)
    }
