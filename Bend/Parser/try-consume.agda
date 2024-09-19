module Bend.Parser.try-consume where

open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Parser.alternative
open import Bend.Parser.consume
open import Data.Bool.Type
open import Data.String.Type

try-consume : String → Parser Bool
try-consume target = do
  (consume target >> (pure True)) <|> (pure False)
