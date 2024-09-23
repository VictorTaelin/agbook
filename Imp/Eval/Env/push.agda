module Imp.Eval.Env.push where

open import Imp.Eval.Env.Type
open import Base.List.Type
import Base.OrdMap.empty as OrdMap

-- Pushes an empty map onto an environment.
push : Env → Env
push e = OrdMap.empty :: e
