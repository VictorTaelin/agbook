module Imp.Eval.Block.step where

open import Imp.Eval.Block.State.Type
open import Imp.Eval.Thread.step as step-thread
open import Data.Buffer.Type
open import Data.Queue.Type
open import Data.Maybe.Type

-- Returns the new `Block` state and the new global memory buffer after a step.
-- The new block returned is a `Maybe Block`, and is `None` if there is no more work.
step : (global : Buffer) → Block → Result (Pair Buffer (Maybe Block))

step global (MkBlock bid shared threads) with (dequeue threads) =
... | Some (Pair thread threads) = do
  state ← step-thread (MkContext global shared) bid thread
  case state of λ where
    ((MkContext global shared) , None       ) → Done (global , MkBlock bid shared threads)
    ((MkContext global shared) , Some thread) → Done (global , MkBlock bid shared (enqueue threads thread))
... | None                  = Done (global , None)
