module UG.SM.ActionLogs.Type where

open import Base.BitMap.Type
open import Base.List.Type
open import Base.BitMap.get
open import Base.BitMap.set
open import Base.Nat.to-bits
open import Base.Maybe.Type
open import Base.List.append

open import UG.SM.Tick.Type

ActionLogs : Set -> Set
ActionLogs A = BitMap (List A)
