module HVM.Run.Run where

open import Base.Pair.Pair
open import HVM.Mode.Mode
open import HVM.Run.State.State

Run : (mode : Mode) → Set → Set
Run mode A = State mode → Pair (State mode) A
