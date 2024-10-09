module UG.SIPD.Event.eq where

import Base.Bool.eq as Bool
import Base.F64.eq as F64
import Base.String.eq as String
import Base.Nat.eq as Nat
import UG.SIPD.Action.eq as Action
import UG.SIPD.Event.Click.eq as Click
open import Base.Bool.Bool
open import Base.Bool.and
open import UG.SIPD.Action.Action
open import UG.SIPD.Event.Click.Click
open import UG.SIPD.Event.Event

eq : Event → Event → Bool
eq (KeyEvent p1 key1 pressed1) (KeyEvent p2 key2 pressed2) =
  (p1 Nat.== p2) && (key1 String.== key2) && (pressed1 Bool.== pressed2)
eq (MouseClick p1 click1 x1 y1) (MouseClick p2 click2 x2 y2) =
  (p1 Nat.== p2) && (click1 Click.== click2) && (x1 F64.== x2) && (y1 F64.== y2)
eq (KeyMouse p1 key1 pressed1 x1 y1) (KeyMouse p2 key2 pressed2 x2 y2) =
  (p1 Nat.== p2) && (key1 String.== key2) && (pressed1 Bool.== pressed2) && (x1 F64.== x2) && (y1 F64.== y2)
eq (MouseMove p1 x1 y1) (MouseMove p2 x2 y2) =
  (p1 Nat.== p2) && (x1 F64.== x2) && (y1 F64.== y2)
eq (ActionEvent action1) (ActionEvent action2) =
  Action.eq action1 action2
eq _ _ = False

-- Defines the infix operator _==_ for Event equality
_==_ : Event → Event → Bool
_==_ = eq

infix 4 _==_
