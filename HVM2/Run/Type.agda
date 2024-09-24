module HVM2.Run.Type where

open import Base.Pair.Type
open import HVM2.Run.State.Type

-- A function with a global HVM2 State
Run : Set -> Set
Run A = State -> Pair State A
