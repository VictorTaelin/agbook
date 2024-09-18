module HVM1.Run.Type where

open import Base.Pair.Type
open import HVM1.Run.State.Type

-- A function with a global HVM1 State
Run : Set → Set
Run A = State → Pair State A
