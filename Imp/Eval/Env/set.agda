module Imp.Eval.Env.set where

open import Base.List.Type
open import Base.Maybe.Type
open import Base.OrdMap.insert renaming (insert to ordmap-insert)
open import Base.Pair.Type
open import Base.String.Trait.Ord
open import Base.String.Type
open import Base.U64.Type
open import Imp.Eval.Env.Type

-- Set a variable's value in the top-most map.
set : Env -> String -> U64 -> Env
set []       _ _ = []
set (m :: r) k v = ((ordmap-insert (k , v) m) :: r)
