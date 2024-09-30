module UG.SIPD.Event.show where

import Base.F64.show as F64
import Base.Nat.show as Nat
import UG.SIPD.Event.Click.show as Click
open import Base.Bool.if
open import Base.String.String
open import Base.String.append
open import UG.SIPD.Event.Event

-- Converts an Event to its string representation.
-- - event: The Event to convert.
-- = A string representation of the Event.
show : Event → String
show (KeyEvent key pressed) = 
  "KeyEvent " ++ key ++ " " ++ (if pressed then "True" else "False")
show (MouseClick click x y) = 
  "MouseClick " ++ Click.show click ++ " " ++ F64.show x ++ " " ++ F64.show y
show (MouseMove x y) = 
  "MouseMove " ++ F64.show x ++ " " ++ F64.show y
