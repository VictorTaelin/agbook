module UG.SIPD.Event.Event where

open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.F64.F64
open import Base.String.String
open import UG.SIPD.Event.Click.Click
open import UG.SIPD.Action.Action

data Event : Set where
  KeyEvent    : (key : String) → (pressed : Bool) → Event
  MouseClick  : Click → (x : F64) → (y : F64) → Event
  KeyMouse    : (key : String) → (pressed : Bool) → (x : F64) → (y : F64) → Event
  MouseMove   : (x : F64) → (y : F64) → Event 
  ActionEvent : Action → Event

KEYEVENT   : Nat; KEYEVENT   = 0
MOUSECLICK : Nat; MOUSECLICK = 1
KEYMOUSE   : Nat; KEYMOUSE   = 2
MOUSEMOVE  : Nat; MOUSEMOVE  = 3

{-# FOREIGN GHC
import qualified Data.Text as T
import MAlonzo.Code.UG.SIPD.Event.Click.Click
import MAlonzo.Code.UG.SIPD.Action.Action

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | KeyMouse T.Text Bool Double Double
  | MouseMove Double Double
  | ActionEvent AgdaAction
#-}

{-# COMPILE GHC Event = data AgdaEvent
  (KeyEvent | MouseClick | KeyMouse | MouseMove | ActionEvent)
#-}
