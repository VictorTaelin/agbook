module UG.SIPD.State.State where

open import Base.Nat.Nat
open import Base.Unit.Unit
open import UG.SM.Tick.Tick

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
