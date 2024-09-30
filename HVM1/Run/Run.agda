module HVM1.Run.Run where

open import Base.Pair.Pair
open import HVM1.Run.State.State

-- A function with a global HVM1 State
Run : Set → Set
Run A = State → Pair State A
