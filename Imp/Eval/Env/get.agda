module Imp.Eval.Env.get where

open import Imp.Eval.Env.Type
open import Base.List.Type
open import Base.Maybe.Type
open import Base.String.Type
open import Base.String.Ord
open import Base.U64.Type
import Base.OrdMap.get as OrdMap

-- Get a variable's value in the top-most map.
get : Env → String → Maybe U64
get []       _ = None
get (m :: _) k = OrdMap.get k m
