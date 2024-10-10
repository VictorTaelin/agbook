module Bend.Fun.Term.map-children-with where

open import Base.List.List renaming (List to List')
open import Base.List.map
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.Trait.Monad
open import Bend.Fun.Term.Term
open import Bend.Fun.Term.mmap-children
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.FnDef.FnDef as FnDef'

-- Applies a function to all immediate child terms of a given term, carrying state.
-- - f: The function to apply to each child term, which also takes and returns a state.
-- - state: The initial state.
-- - term: The term whose children we want to map over.
-- = A pair of the final state and the new term with the function applied to all immediate children.
map-children-with : ∀ {A : Set} → (A → Term → Pair A Term) → A → Term → Pair A Term
map-children-with f state term =
  run-state (mmap-children {{state-monad}} (λ t → to-state (λ s → f s t))) state term
  where
  -- Define a simple state monad
  StateM : Set → Set → Set
  StateM S B = S → Pair B S

  -- State monad instance
  state-monad : ∀ {S} → Monad (StateM S)
  state-monad = record
    { pure = λ x s → (x , s)
    ; bind = λ m f s → let (a , s') = m s in f a s'
    }

  -- Lift a function to StateM
  to-state : ∀ {S B} → (S → Pair B S) → StateM S B
  to-state f s = f s

  -- Run the state monad
  run-state : ∀ {S B} → StateM S B → S → Pair B S
  run-state m s = m s
