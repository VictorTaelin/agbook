module Imp.Eval.Grid.step where

open import Imp.Eval.Grid.State.Type
open import Imp.Eval.Block.step as step-block
open import Data.Queue.Type
open import Data.Maybe.Type

-- Returns the new `Grid` after a step if there is work to be done.
-- If the grid is already normalized, then `Done None` is returned.
step : Grid → Result (Maybe Grid)

step (MkGrid global blocks) with (dequeue blocks) =
... | Some (Pair block blocks) = do
  state ← step-block global block
  case state of λ where
    (global , None      ) → Done (MkGrid global blocks)
    (global , Some block) → Done (MkGrid global (enqueue blocks block))
... | None                  = Done None
