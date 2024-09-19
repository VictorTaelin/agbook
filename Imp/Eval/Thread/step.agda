module Imp.Eval.Thread.step where

open import Imp.Eval.Thread.State.Type
open import Data.Maybe.Type
open import Data.Result.Type as Result'

private
  Result = Result' Delta String

-- steps a thread's execution given a block id
-- returns a new context and thread state if the thread is not done
step : (context : Context) → (state : Thread) → Result (Pair Context (Maybe Thread))

step context (MkThread tid vars (Locals vs)) = Done (context , None)
step context (MkThread tid vars (Locals vs)) = Done (context , None)
