module HVM.Run.boot where

import HVM.Run.State.boot as State
open import Base.Pair.Pair
open import Base.Unit.Unit
open import HVM.Mode.Mode
open import HVM.Net.Net
open import HVM.Run.Run
open import HVM.Run.State.State

-- Creates a Run computation that boots a fresh state with the given net and mode.
-- - net: The initial net for the state.
-- = A Run computation that produces Unit and sets up the initial state.
boot : ∀ {mode : Mode} → Net mode → Run mode Unit
boot net state = (State.boot net , unit)
