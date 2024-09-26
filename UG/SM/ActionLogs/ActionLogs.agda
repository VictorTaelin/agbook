module UG.SM.ActionLogs.ActionLogs where

open import Base.BitMap.BitMap
open import Base.List.List
open import Base.BitMap.get
open import Base.BitMap.set
open import Base.Nat.to-bits
open import Base.Maybe.Maybe
open import Base.List.append

open import UG.SM.Tick.Tick

ActionLogs : Set -> Set
ActionLogs A = BitMap (List A)
