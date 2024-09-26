module UG.SM.TimedAction.TimedAction where

open import UG.SM.Time.Time

-- Used to bind an action to a timestamp
record TimedAction (A : Set) : Set where
  field
    action : A
    time : Time
