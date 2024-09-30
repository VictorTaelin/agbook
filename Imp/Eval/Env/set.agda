module Imp.Eval.Env.set where

open import Base.List.List
open import Base.Maybe.Maybe
open import Base.OrdMap.insert renaming (insert to ordmap-insert)
open import Base.Pair.Pair
open import Base.String.Trait.Ord
open import Base.String.String
open import Base.U64.U64
open import Imp.Eval.Env.Env

-- Set a variable's value in the top-most map.
set : Env → String → U64 → Env
set []       _ _ = []
set (m :: r) k v = ((ordmap-insert (k , v) m) :: r)
