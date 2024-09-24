module HVM2.Run.boot where

import HVM2.Run.State.boot as HVM2
open import Base.Pair.Type
open import Base.Unit.Type
open import HVM2.Net.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type

-- Creates a Run computation that boots a fresh state with the given net.
-- - net: The initial net for the state.
-- = A Run computation that produces Unit and sets up the initial state.
boot : Net -> Run Unit
boot net state = (HVM2.boot net , unit)
