module HVM.Runtime.boot where

import HVM.State.boot as HVM
open import Data.Pair.Type
open import Data.Unit.Type
open import HVM.Net.Type
open import HVM.Runtime.Type
open import HVM.State.Type

-- Creates a Runtime computation that boots a fresh state with the given net.
-- - net: The initial net for the state.
-- = A Runtime computation that produces Unit and sets up the initial state.
boot : Net → Runtime Unit
boot net state = (HVM.boot net , unit)
