module HVM.Runtime.Type where

open import Data.Pair.Type
open import HVM.State.Type

-- A function with a global HVM State
Runtime : Set → Set
Runtime A = State → Pair State A
