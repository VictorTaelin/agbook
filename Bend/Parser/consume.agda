module Bend.Parser.consume where

open import Base.Parser.Type
open import Base.Parser.Monad.bind
open import Bend.Parser.skip-trivia
open import Bend.Parser.consume-exactly
open import Base.String.Type
open import Base.Unit.Type

consume : String → Parser Unit
consume target = do
  skip-trivia
  consume-exactly target
