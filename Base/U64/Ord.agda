module Base.U64.Ord where

open import Base.U64.Type
open import Base.Nat.Type
open import Base.Nat.Ord
open import Base.Bool.Type
open import Base.Trait.Ord

instance
  OrdU64 : Ord U64
  OrdU64 = record
    { _<_  = λ x y → _<_  {{OrdNat}} (primWord64ToNat x) (primWord64ToNat y)
    ; _<=_ = λ x y → _<=_ {{OrdNat}} (primWord64ToNat x) (primWord64ToNat y)
    ; _>_  = λ x y → _>_  {{OrdNat}} (primWord64ToNat x) (primWord64ToNat y)
    ; _>=_ = λ x y → _>=_ {{OrdNat}} (primWord64ToNat x) (primWord64ToNat y)
    }
