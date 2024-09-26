module Bend.Parser.try-consume-exactly where

open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.alternative
open import Bend.Parser.consume-exactly
open import Base.Bool.Bool
open import Base.String.String

try-consume-exactly : String -> Parser Bool
try-consume-exactly target = do
  (consume-exactly target >> (pure True)) <|> (pure False)
