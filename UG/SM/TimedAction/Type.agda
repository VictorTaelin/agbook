module UG.SM.TimedAction.Type where

open import UG.SM.Time.Type

-- Used to bind an action to a timestamp
record TimedAction (A : Set) : Set where
  field
    action : A
    time : Time
