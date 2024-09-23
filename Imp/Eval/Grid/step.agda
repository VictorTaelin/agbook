module Imp.Eval.Grid.step where

open import Imp.Eval.Grid.State.Type
open import Imp.Eval.Block.step renaming (step to step-block)
open import Base.Function.case
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.Queue.dequeue
open import Base.Queue.enqueue
open import Base.Queue.Type
open import Base.Result.Monad.bind
open import Base.Result.Type
open import Base.String.Type

-- Returns the new `Grid` after a step if there is work to be done.
-- If the grid is already normalized, then `Done None` is returned.
step : Grid → Result (Maybe Grid) String

step (MkGrid global blocks) with (dequeue blocks)
... | Some (block , blocks) = do
  state ← step-block global block
  case state of λ where
    (global , None      ) → Done (Some (MkGrid global blocks))
    (global , Some block) → Done (Some (MkGrid global (enqueue blocks block)))
... | None                  = Done None
