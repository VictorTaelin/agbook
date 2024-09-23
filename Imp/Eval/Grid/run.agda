module Imp.Eval.Grid.run where

open import Imp.Eval.Grid.State.Type
open import Imp.Eval.Grid.step as Grid
open import Base.Buffer.Type
open import Base.String.Type
open import Base.Maybe.Type
open import Base.Result.Type
open import Base.Result.Monad.bind
open import Base.Function.case

-- Runs a grid until there is no more work to be done and
-- returns the global memory.
{-# NON_TERMINATING #-}
run : Grid → Result Buffer String

run grid@(MkGrid global blocks) = do
  new-grid ← (Grid.step grid)
  case new-grid of λ where
    (Some grid) → run grid
    None        → Done global
