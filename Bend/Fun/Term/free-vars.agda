module Bend.Fun.Term.free-vars where

open import Base.BinMap.BinMap
open import Base.BinMap.contains
open import Base.BinMap.empty
open import Base.BinMap.from-list
open import Base.BinMap.union
open import Base.Bool.Bool
open import Base.List.List
open import Base.List.concat
open import Base.List.dedup
open import Base.List.map
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.String.Trait.Ord
open import Base.String.String
open import Base.String.hash
open import Base.Unit.Unit
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.children-with-binds

-- Collects all the free variables that a term has
-- - term: The term to analyze
-- = A list of all the free variables in the term, in the order they appear
free-vars : Term → List String
free-vars term = dedup (go term empty)
  where
    go : Term → BinMap Unit → List String
    go (Var nam) scope with (contains scope (hash nam))
    ... | True = []
    ... | False = nam :: []
    go term scope = do
      let cs = children-with-binds term
      let add-scope bnd scope = do
        let bnd = map (λ b → (hash b) , unit) bnd
        union (from-list bnd) scope
      concat (map (λ (bnd , child) → go child (add-scope bnd scope)) cs)
