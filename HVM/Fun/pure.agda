module HVM.Fun.pure where

open import HVM.Fun.Type
open import HVM.Env.Type
open import Data.Pair.Type

-- Creates a Fun computation that always succeeds with the given value without modifying the environment
pure : ∀ {A : Set} → A → Fun A
pure x = λ env → (env , x)
