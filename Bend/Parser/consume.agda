module Bend.Parser.consume where

open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Bend.Parser.skip-trivia
open import Bend.Parser.consume-exactly
open import Base.String.String
open import Base.Unit.Unit

consume : String → Parser Unit
consume target = do
  skip-trivia
  consume-exactly target
