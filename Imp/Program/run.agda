module Imp.Program.run where

import Base.Buffer.new as Buffer
import Imp.Eval.State.Grid.new as GridState
import Imp.Eval.State.Grid.run as GridState
open import Base.Buffer.Buffer
open import Base.List.List
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.String.String
open import Imp.Program.Program
open import Imp.Program.Grid.Grid

run : Program -> Result Buffer String
run (MkProgram global grids) = run-grids (Buffer.new global) grids
  where

  run-grids : Buffer -> List Grid -> Result Buffer String
  run-grids global grids with grids
  ... | [] = Done global
  ... | (MkGrid shared blocks threads code) :: grids = do
    global <- GridState.run (GridState.new global shared blocks threads code)
    run-grids global grids
