module HVM1.Run.state-get where

open import HVM1.Run.Type
open import HVM1.Run.State.Type
open import Base.Pair.Type

state-get : Run State
state-get = λ s -> (s , s)
