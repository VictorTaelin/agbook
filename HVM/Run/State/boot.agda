module HVM.Run.State.boot where

open import Base.OrdMap.OrdMap
open import Base.OrdMap.empty
open import Base.String.String
open import Base.Nat.Nat
open import Base.Unit.Unit
open import HVM.Net.Net
open import HVM.Run.State.State
open import HVM.Term.Term

-- Creates a fresh state given a net and a mode.
-- - net: The initial net for the state.
-- = A new State with the given net, empty substitutions (if in NAMED mode), and fresh variable counter (if in NAMED mode).
boot : Net → State
boot net = MkState net empty 0

