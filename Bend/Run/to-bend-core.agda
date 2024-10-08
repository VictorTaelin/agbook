module Bend.Run.to-bend-core where

open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.String.String
open import Base.Trait.Monad
open import Bend.Fun.Book.Book
open import Bend.Run.AdtEncoding
open import Bend.Transform.FloatCombinators.float-combinators
open import Bend.Transform.desugar-open
open import Bend.Transform.desugar-use
open import Bend.Transform.encode-adts
open import Bend.Transform.encode-match-terms
open import Bend.Transform.fix-match-terms
open import Bend.Transform.linearize-match-with
open import Bend.Transform.linearize-matches
open import Bend.Transform.linearize-vars
open import Bend.Transform.rebuild-match-ctrs
open import Bend.Transform.resolve-refs
open import Bend.Transform.unbound-refs
open import Bend.Transform.unbound-vars
open import Bend.Transform.unique-names

-- Desugars and apply all the Term-level transformations to a Book.
to-bend-core : Book → Result Book String
to-bend-core book = do
  book     ← encode-adts NumScott book  -- TODO: get encoding from options

  book     ← desugar-open book

  let book = resolve-refs book
  book     ← fix-match-terms book

  book     ← rebuild-match-ctrs book
  let book = unique-names book
  let book = desugar-use book

  let book = linearize-matches book     -- TODO: other strategy for linearization
  let bood = linearize-match-with book

  book     ← encode-match-terms NumScott book
  unbound-vars book                     -- Sanity check

  let book = unique-names book
  let book = desugar-use book

  let book = unique-names book
  let book = linearize-vars book
  unbound-vars book                     -- Sanity check

  let book = float-combinators book 64  -- TODO: get max net size from options
  unbound-refs book

  let book = unique-names book
  Done book

