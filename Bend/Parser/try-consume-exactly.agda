module Bend.Parser.try-consume-exactly where

open import Base.Parser.Type
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.alternative
open import Bend.Parser.consume-exactly
open import Base.Bool.Type
open import Base.String.Type

try-consume-exactly : String → Parser Bool
try-consume-exactly target = do
  (consume-exactly target >> (pure True)) <|> (pure False)
