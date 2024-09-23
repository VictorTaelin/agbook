module Imp.Eval.Env.pop where

open import Imp.Eval.Env.Type
open import Base.List.Type
import Base.OrdMap.empty as OrdMap

-- Pops the top-level empty map from an environment.
pop : Env → Env
pop []       = []
pop (_ :: e) = e
