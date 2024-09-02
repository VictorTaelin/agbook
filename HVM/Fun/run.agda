module HVM.Fun.run where

open import Data.Bits.Type
open import Data.Map.Type
open import Data.Map.empty
open import Data.Pair.Type
open import HVM.Env.Type
open import HVM.Fun.Type
open import HVM.Term.Type

-- Runs a Fun A computation with an initial Env, returning an A
run : ∀ {A : Set} → Fun A → A
run fun = do
  let (env , res) = fun (New E empty)
  res
