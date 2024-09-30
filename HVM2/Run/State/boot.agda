module HVM2.Run.State.boot where

open import Base.OrdMap.OrdMap
open import Base.OrdMap.empty
open import Base.String.String
open import HVM2.Net.Net
open import HVM2.Run.State.State
open import HVM2.Term.Term

-- Creates a fresh state given a net.
-- - net: The initial net for the state.
-- = A new State with the given net, empty substitutions, and fresh variable counter.
boot : Net → State
boot net = MkState net empty 0
