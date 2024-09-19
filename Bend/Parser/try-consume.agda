module Bend.Parser.try-consume where

open import Base.Parser.Type
open import Base.Parser.bind
open import Base.Parser.pure
open import Base.Parser.alternative
open import Bend.Parser.consume
open import Base.Bool.Type
open import Base.String.Type

try-consume : String → Parser Bool
try-consume target = do
  (consume target >> (pure True)) <|> (pure False)
