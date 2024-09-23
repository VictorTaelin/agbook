module Imp.Eval.Block.step where

open import Imp.Eval.Block.State.Type
open import Imp.Eval.Thread.step renaming (step to step-thread)
open import Imp.Eval.Memory.Type
open import Base.Buffer.Type
open import Base.Function.case
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.Queue.dequeue
open import Base.Queue.enqueue
open import Base.Queue.Type
open import Base.Result.Monad.bind
open import Base.Result.Type
open import Base.String.Type

private
  StepResult = Result (Pair Buffer (Maybe Block)) String

-- Steps a block in execution given global memory. The modified global
-- memory is returned. A `Maybe Block` is also returned in case there
-- is more work to be done by the block.
step : (global : Buffer) → Block → StepResult

step global (MkBlock bid shared threads) with (dequeue threads)

... | Some (thread , threads) = do
  state ← step-thread (MkMemory global shared) bid thread
  case state of λ where
    ((MkMemory global shared) , None       ) → Done (global , Some (MkBlock bid shared threads))
    ((MkMemory global shared) , Some thread) → Done (global , Some (MkBlock bid shared (enqueue threads thread)))

... | None                  = Done (global , None)
