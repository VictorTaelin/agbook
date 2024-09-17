module HVM1.Run.get-state where

open import HVM1.Run.Type
open import HVM1.Run.State.Type
open import Data.Pair.Type

get-state : Run State
get-state = λ s → (s , s)
