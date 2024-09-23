module Imp.Eval.Env.set where

open import Imp.Eval.Env.Type
open import Base.List.Type
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.String.Ord
open import Base.String.Type
open import Base.U64.Type
import Base.OrdMap.insert as OrdMap

-- Set a variable's value in the top-most map.
set : Env → String → U64 → Env
set []       _ _ = []
set (m :: r) k v = ((OrdMap.insert (k , v) m) :: r)
