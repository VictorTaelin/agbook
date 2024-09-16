module UG.SM.StateLogs.Type where

open import UG.SM.Tick.Type

open import Data.Map.Type
open import Data.Nat.Type

-- Maps from bit indices to States
StateLogs : Set → Set
StateLogs S = Map S
