module Imp.Eval.Env.new where

import Base.OrdMap.empty as OrdMap
open import Base.List.List
open import Imp.Eval.Env.Env

-- A new environment is an environment with an empty mapping at the top.
new : Env
new = OrdMap.empty :: []
