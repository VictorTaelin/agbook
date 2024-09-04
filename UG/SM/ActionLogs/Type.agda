module UG.SM.ActionLogs.Type where

open import Data.Map.Type
open import Data.List.Type
open import Data.Map.get
open import Data.Map.set
open import Data.Nat.to-bits
open import Data.Maybe.Type
open import Data.List.append

open import UG.SM.Tick.Type

ActionLogs : Set → Set
ActionLogs A = Map (List A)
