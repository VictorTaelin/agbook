module Imp.Eval.Env.Type where

open import Base.List.Type
open import Base.OrdMap.Type
open import Base.String.Type
open import Base.U64.Type

-- An environment, or a stack of variable maps.
-- Since functions are inlined, we need a way to represent
-- stacks of variable maps.

Env = List (OrdMap String U64)
