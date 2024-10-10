module HVM.Run.Run where

open import Base.Pair.Pair
open import HVM.Run.State.State

Run : Set → Set
Run A = State → Pair State A

