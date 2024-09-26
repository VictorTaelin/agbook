module Imp.Eval.Env.get where

open import Base.List.List
open import Base.Maybe.Maybe
open import Base.OrdMap.get renaming (get to ordmap-get)
open import Base.String.Trait.Ord
open import Base.String.String
open import Base.U64.U64
open import Imp.Eval.Env.Env

-- Get a variable's value in the top-most map.
get : Env -> String -> Maybe U64
get []       _ = None
get (m :: _) k = ordmap-get k m
