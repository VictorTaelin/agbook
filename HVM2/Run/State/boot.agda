module HVM2.Run.State.boot where

open import Base.OrdMap.Type
open import Base.OrdMap.empty
open import Base.String.Type
open import HVM2.Net.Type
open import HVM2.Run.State.Type
open import HVM2.Term.Type

-- Creates a fresh state given a net.
-- - net: The initial net for the state.
-- = A new State with the given net, empty substitutions, and fresh variable counter.
boot : Net -> State
boot net = MkState net empty 0
