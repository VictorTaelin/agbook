module Bend.Run.to-bend-core where

open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.String.String
open import Base.Trait.Monad
open import Bend.Fun.Book.Book
open import Bend.Transform.linearize-vars
open import Bend.Transform.resolve-refs
open import Bend.Transform.unbound-refs
open import Bend.Transform.unbound-vars
open import Bend.Transform.unique-names

-- Desugars and apply all the Term-level transformations to a Book.
to-bend-core : Book -> Result Book String
to-bend-core book = do
  let book = resolve-refs book
  unbound-vars book
  unbound-refs book
  let book = unique-names book
  let book = linearize-vars book
  let book = unique-names book
  Done book
