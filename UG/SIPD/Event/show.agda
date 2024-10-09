module UG.SIPD.Event.show where

import Base.F64.show as F64
import Base.Nat.show as Nat
import UG.SIPD.Event.Click.show as Click
import UG.SIPD.Action.show as Action
open import Base.Bool.if
open import Base.String.String
open import Base.String.append
open import UG.SIPD.Event.Event
open import Base.Word8.to-nat
import Base.Nat.show as Nat

-- Converts an Event to its string representation.
-- - event: The Event to convert.
-- = A string representation of the Event.
show : Event → String
show (KeyEvent pid key pressed) = 
  "KeyEvent " ++ (Nat.show (to-nat pid)) ++ " " ++ key ++ " " ++ (if pressed then "True" else "False")
show (MouseClick pid click x y) = 
  "MouseClick " ++ (Nat.show (to-nat pid)) ++ " " ++ Click.show click ++ " " ++ F64.show x ++ " " ++ F64.show y
show (KeyMouse  pid key pressed x y) =
  "KeyMouse " ++ (Nat.show (to-nat pid)) ++ " " ++ key ++ " " ++ (if pressed then "True" else "False") ++ " " ++ F64.show x ++ " " ++ F64.show y
show (MouseMove pid x y) = 
  "MouseMove " ++ (Nat.show (to-nat pid)) ++ " " ++ F64.show x ++ " " ++ F64.show y
show (ActionEvent action) = Action.show action
