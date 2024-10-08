module UG.SM.ActionLogs.ActionLogs where

open import Base.BinMap.BinMap
open import Base.List.List
open import Base.BinMap.get
open import Base.BinMap.set
open import Base.Nat.to-bits
open import Base.Maybe.Maybe
open import Base.List.append

open import UG.SM.Tick.Tick

ActionLogs : Set → Set
ActionLogs A = BinMap (List A)
