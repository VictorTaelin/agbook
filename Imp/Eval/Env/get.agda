module Imp.Eval.Env.get where

open import Base.List.Type
open import Base.Maybe.Type
open import Base.OrdMap.get renaming (get to ordmap-get)
open import Base.String.Trait.Ord
open import Base.String.Type
open import Base.U64.Type
open import Imp.Eval.Env.Type

-- Get a variable's value in the top-most map.
get : Env -> String -> Maybe U64
get []       _ = None
get (m :: _) k = ordmap-get k m
