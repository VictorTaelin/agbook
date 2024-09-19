module Bend.Parser.consume where

open import Data.Parser.Type
open import Data.Parser.bind
open import Bend.Parser.skip-trivia
open import Bend.Parser.consume-exactly
open import Data.String.Type
open import Data.Unit.Type

consume : String → Parser Unit
consume target = do
  skip-trivia
  consume-exactly target
