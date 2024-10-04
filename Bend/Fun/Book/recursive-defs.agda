module Bend.Fun.Book.recursive-defs where

open import Base.Bool.if
open import Base.Bool.not
open import Base.BitMap.BitMap
open import Base.BitMap.contains
open import Base.BitMap.empty
open import Base.BitMap.from-list
open import Base.BitMap.get
open import Base.BitMap.set
open import Base.BitMap.values
open import Base.Function.case
open import Base.List.List
open import Base.List.append
open import Base.List.concat
open import Base.List.concat-map
open import Base.List.dedup
open import Base.List.foldr
open import Base.List.map
open import Base.List.split-chunks
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.Trait.Ord
open import Base.String.hash
open import Base.String.eq
open import Base.String.neq
open import Base.Trait.Ord
open import Base.Unit.Unit
open import Bend.Fun.Book.Book
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.children
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'
import Base.BitMap.map as BitMap

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

-- Returns a list of all recursive functions in a Book.
recursive-defs : Book → List String
recursive-defs book = do
  let deps = book-deps book
  let defs = map (λ def → FnDef.name def) (values (Book.defs book))
  let cycles = book-cycles deps defs
  dedup (concat cycles)

  where

  term-deps : Term → List String
  term-deps (Ref nam) = nam :: []
  term-deps term = concat-map term-deps (children term)

  def-deps : FnDef → BitMap String
  def-deps (MkFnDef _ _ _ rules _) = do
    let deps = concat-map (λ rule → term-deps (Rule.body rule)) rules
    from-list (map (λ dep → (hash dep , dep)) deps)

  -- Collect the direct function dependencies of a Book.
  -- That is, for each function, which functions appear as Ref in its body.
  book-deps : Book → BitMap (BitMap String)
  book-deps (MkBook defs _ _) = BitMap.map def-deps defs

  -- Walks the dependency graph to find all cycles.
  -- TODO: Use a more efficient algorithm that doesn't need to check the entire path.
  def-cycles : BitMap (BitMap String) → BitMap Unit → List (List String) → List (Pair String (List String))
              → (List (List String))
  def-cycles deps visited cycles [] = do
    cycles
  def-cycles deps visited cycles ((nam , path) :: to-visit) = do
    if contains visited (hash nam)
      then (do
        -- Check if the current ref is already in the stack, which indicates a cycle.
        let cycles = case split-chunks (λ def → def == nam) path of λ where
          -- Current def is in path, so we've found a cycle
          (cycle :: _ :: _) → (nam :: cycle) :: cycles
          -- Current def not in path, not a cycle
          _                 → cycles
        def-cycles deps visited cycles to-visit)
      else (do
        let visited = set visited (hash nam) unit
        let path = nam :: path
        let new = case get deps (hash nam) of λ where
          (Some deps) → map (λ dep → dep , path) (values deps)
          None        → []
        def-cycles deps visited cycles (new ++ to-visit))

  -- Return the list of all recursive function call cycles in a Book.
  -- - deps: The direct function dependencies of the Book.
  -- - defs: A list of names of all function definitions in the Book.
  -- = A list of lists of function names, where each list represents a cycle.
  book-cycles : BitMap (BitMap String) → List String → List (List String)
  book-cycles deps defs = def-cycles deps empty [] (map (λ def → (def , [])) defs)
