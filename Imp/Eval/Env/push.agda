module Imp.Eval.Env.push where

open import Base.List.Type
open import Base.OrdMap.empty renaming (empty to ordmap-empty)
open import Imp.Eval.Env.Type

-- Pushes an empty map onto an environment.
push : Env -> Env
push e = ordmap-empty :: e
