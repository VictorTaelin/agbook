module UG.SM.TimedAction.Type where

open import UG.SM.Time.Type

-- Represents an action with a time
record TimedAction (A : Set) : Set where
  field
    action : A
    time : Time
