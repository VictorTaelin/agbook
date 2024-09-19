module Imp.Eval.Context.Type where

open import Imp.Eval.Thread.State.Type
open import Data.Buffer.Type

-- The memory context required to step a thread
record Context : Set where
  global : Buffer
  shared : Buffer
