module UG.SM.StateLogs.Type where

open import UG.SM.Tick.Type

open import Data.Map.Type
open import Data.Map.remove
open import Data.Nat.Type
open import Data.Nat.lt
open import Data.Nat.to-bits
open import Data.Nat.add
open import Data.Bool.if

-- Maps from bit indices to States
StateLogs : Set → Set
StateLogs S = Map S
