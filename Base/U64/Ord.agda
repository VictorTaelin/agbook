module Base.U64.Ord where

open import Base.Bool.Type
open import Base.Nat.Ord
open import Base.Ord.Trait
open import Base.U64.Type

instance
  OrdU64 : Ord U64
  OrdU64 = record
    { compare = λ x y → compare (primWord64ToNat x) (primWord64ToNat y)
    ; _<_     = λ x y → _<_     (primWord64ToNat x) (primWord64ToNat y)
    ; _<=_    = λ x y → _<=_    (primWord64ToNat x) (primWord64ToNat y)
    ; _>_     = λ x y → _>_     (primWord64ToNat x) (primWord64ToNat y)
    ; _>=_    = λ x y → _>=_    (primWord64ToNat x) (primWord64ToNat y)
    }
