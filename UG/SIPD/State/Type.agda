module UG.SIPD.State.Type where

open import Data.Map.Type
open import Data.Nat.Type
open import UG.SM.Tick.Type
open import UG.SIPD.Player.Type
open import Data.Unit.Type

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

