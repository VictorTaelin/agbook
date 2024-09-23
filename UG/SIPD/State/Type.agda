module UG.SIPD.State.Type where

open import Base.Map.Type
open import Base.Nat.Type
open import Base.Unit.Type
open import UG.SIPD.Player.Type
open import UG.SM.Tick.Type

-- Represents the state of the game
record State : Set where
  constructor MkState
  field
    clickCount  : Nat

{-# FOREIGN GHC
data State = MkState
  { clickCount :: Integer
  }
#-}

{-# COMPILE GHC State = data State (MkState) #-}
