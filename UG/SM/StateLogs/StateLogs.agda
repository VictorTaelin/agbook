module UG.SM.StateLogs.StateLogs where

open import UG.SM.Tick.Tick

open import Base.BitMap.BitMap
open import Base.Nat.Nat

-- Maps from bit indices to States
StateLogs : Set → Set
StateLogs S = BitMap S
