module HVM.Fun.Type where

open import HVM.Env.Type
open import Data.Pair.Type

-- Represents a function with a global Env state.
Fun : Set → Set
Fun A = Env → Pair Env A
