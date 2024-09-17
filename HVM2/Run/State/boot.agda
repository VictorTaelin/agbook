module HVM2.Run.State.boot where

open import Data.Bits.Type
open import Data.Map.Type
open import Data.Map.empty
open import Data.Nat.Type
open import HVM2.Net.Type
open import HVM2.Run.State.Type

-- Creates a fresh state given a net.
-- - net: The initial net for the state.
-- = A new State with the given net, empty substitutions, and fresh variable counter.
boot : Net → State
boot net = MkState net empty E
