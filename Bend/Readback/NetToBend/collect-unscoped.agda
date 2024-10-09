module Bend.Readback.NetToBend.collect-unscoped where

open import Base.Bool.if
open import Base.List.List
open import Base.List.append
open import Base.List.concat-map
open import Base.List.contains
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.Trait.Eq
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.children-with-binds
import Base.String.append as String

-- Find which names refer to unscoped variables by filtering vars that
-- don't have a binding in scope.
-- - term: The term to search in.
-- - scope: A list of variables in scope.
--          An internal argument that should be empty when calling.
-- = The list of unscoped variables in the term.
collect-unscoped : Term → List String → List String

collect-unscoped (Var nam) scope = do
  if (contains nam scope)
    then []
    else nam :: []

-- 'switch' terms have a hidden bind for 'pred' that we don't store
-- in the term during readback to avoid printing it later.
collect-unscoped (Swt (Some bnd) arg _ with-arg _ (zero :: succ :: [])) scope = do
  let x1 = collect-unscoped arg scope
  let x2 = concat-map (λ arg → collect-unscoped arg scope) with-arg
  let x3 = collect-unscoped zero scope
  let x4 = collect-unscoped succ (String.append bnd "-1" :: scope)
  x1 ++ x2 ++ x3 ++ x4

-- Unreachable
collect-unscoped (Swt _ _ _ _ _ _) scope = do
  scope

collect-unscoped term scope = do
  concat-map (λ (binds , child) → collect-unscoped child (binds ++ scope))
              (children-with-binds term)

