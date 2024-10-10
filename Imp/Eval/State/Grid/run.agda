module Imp.Eval.State.Grid.run where

open import Base.Buffer.Buffer
open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Result.Monad.bind
open import Base.Result.Result
open import Base.String.String
open import Imp.Eval.State.Grid.Grid
open import Imp.Eval.State.Grid.step as Grid

-- Runs a grid until there is no more work to be done and
-- returns the global memory.
{-# TERMINATING #-} -- FIXME!
run : Grid → Result Buffer String

run grid@(MkGrid global blocks) = do
  maybe-grid ← (Grid.step grid)
  case maybe-grid of λ where
    (Some grid) → run grid
    None        → Done global

