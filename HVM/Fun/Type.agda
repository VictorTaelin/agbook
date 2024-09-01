module HVM.Fun.Type where

open import Data.Pair.Type
open import HVM.Env.Type

-- Represents a function with a global Env state.
Fun : Set → Set
Fun A = Env → Pair Env A
