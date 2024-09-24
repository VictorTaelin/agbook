module UG.SM.StateLogs.Type where

open import UG.SM.Tick.Type

open import Base.BitMap.Type
open import Base.Nat.Type

-- Maps from bit indices to States
StateLogs : Set -> Set
StateLogs S = BitMap S
