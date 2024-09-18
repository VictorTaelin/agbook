module UG.SM.ActionLogs.Type where

open import Base.Map.Type
open import Base.List.Type
open import Base.Map.get
open import Base.Map.set
open import Base.Nat.to-bits
open import Base.Maybe.Type
open import Base.List.append

open import UG.SM.Tick.Type

ActionLogs : Set → Set
ActionLogs A = Map (List A)
