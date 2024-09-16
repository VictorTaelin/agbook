module UG.SIPD.Game.Type where

open import UG.SIPD.State.Type
open import UG.SIPD.Action.Type
open import Data.IO.Type
open import Data.Unit.Type

open import Data.IO.bind
open import Data.IO.pure

record Game : Set where
  constructor MkGame
  field
    init : State
    when : Action → State → State
    tick : State → State
    draw : State → IO Unit

{-# FOREIGN GHC
import MAlonzo.Code.UG.SIPD.State.Type (State(..))

data Game = MkGame
  { init :: State
    -- when
  , tick :: State -> State
    -- draw
  }
#-}

main : IO Unit
main = do
  pure unit
