module HVM.Runtime.run where

open import Data.Bits.Type
open import Data.List.Type
open import Data.Map.Type
open import Data.Map.empty
open import Data.Pair.Type
open import HVM.Net.Type
open import HVM.Runtime.Type
open import HVM.State.Type
open import HVM.Term.Type

-- Runs a Runtime A computation with an initial State, returning an A
run : ∀ {A : Set} → Runtime A → A
run fun = do
  let initial-net = MkNet [] Era
  let (_ , res) = fun (MkState initial-net empty E)
  res
