module Imp.Eval.Env.pop where

open import Base.List.List
open import Base.OrdMap.empty renaming (empty to ordmap-empty)
open import Imp.Eval.Env.Env

-- Pops the top-level empty map from an environment.
pop : Env → Env
pop []       = []
pop (_ :: e) = e

