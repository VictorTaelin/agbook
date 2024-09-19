module HVM2.Run.State.boot where

open import Base.Bits.Type
open import Base.Map.Type
open import Base.Map.empty
open import Base.Nat.Type
open import HVM2.Net.Type
open import HVM2.Run.State.Type

-- Creates a fresh state given a net.
-- - net: The initial net for the state.
-- = A new State with the given net, empty substitutions, and fresh variable counter.
boot : Net → State
boot net = MkState net empty E
