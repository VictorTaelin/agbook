module UG.SIPD.Game.Game where

import UG.SM.Game.Game as SM
open import UG.SIPD.State.State
open import UG.SIPD.Event.Event

Game : Set
Game = SM.Game State Event

