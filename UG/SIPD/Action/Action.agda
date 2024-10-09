module UG.SIPD.Action.Action where

open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.F64.F64
open import Base.Word8.Word8
open import Base.String.String
open import UG.SIPD.Event.Click.Click

-- Similar to an SIPD.Event.Event, but represents player actions regarding the game (or meta-game)
-- instead of computer interaction
data Action : Set where
  SetNick : (pid : Nat) → String → Action

SETNICK : Nat; SETNICK = 101

{-# FOREIGN GHC
import qualified Data.Text as T

data AgdaAction
  = SetNick Integer T.Text
#-}

{-# COMPILE GHC Action = data AgdaAction (SetNick) #-}
