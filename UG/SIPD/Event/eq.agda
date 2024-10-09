module UG.SIPD.Event.eq where

import Base.Bool.eq as Bool
import Base.F64.eq as F64
import Base.String.eq as String
import UG.SIPD.Action.eq as Action
import UG.SIPD.Event.Click.eq as Click
open import Base.Bool.Bool
open import Base.Bool.and
open import UG.SIPD.Action.Action
open import UG.SIPD.Event.Click.Click
open import UG.SIPD.Event.Event

eq : Event → Event → Bool
eq (KeyEvent key1 pressed1) (KeyEvent key2 pressed2) =
  (key1 String.== key2) && (pressed1 Bool.== pressed2)
eq (MouseClick click1 x1 y1) (MouseClick click2 x2 y2) =
  (click1 Click.== click2) && (x1 F64.== x2) && (y1 F64.== y2)
eq (KeyMouse key1 pressed1 x1 y1) (KeyMouse key2 pressed2 x2 y2) =
  (key1 String.== key2) && (pressed1 Bool.== pressed2) && (x1 F64.== x2) && (y1 F64.== y2)
eq (MouseMove x1 y1) (MouseMove x2 y2) =
  (x1 F64.== x2) && (y1 F64.== y2)
eq (ActionEvent action1) (ActionEvent action2) =
  Action.eq action1 action2
eq _ _ = False

-- Defines the infix operator _==_ for Event equality
_==_ : Event → Event → Bool
_==_ = eq

infix 4 _==_

