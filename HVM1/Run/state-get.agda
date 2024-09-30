module HVM1.Run.state-get where

open import HVM1.Run.Run
open import HVM1.Run.State.State
open import Base.Pair.Pair

state-get : Run State
state-get = λ s → (s , s)
