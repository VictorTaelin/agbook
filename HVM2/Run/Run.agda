module HVM2.Run.Run where

open import Base.Pair.Pair
open import HVM2.Run.State.State

-- A function with a global HVM2 State
Run : Set → Set
Run A = State → Pair State A
