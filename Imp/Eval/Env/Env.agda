module Imp.Eval.Env.Env where

open import Base.List.List
open import Base.OrdMap.OrdMap
open import Base.String.String
open import Base.U64.U64

-- An environment, or a stack of variable maps.
-- Since functions are inlined, we need a way to represent
-- stacks of variable maps.

Env = List (OrdMap String U64)
