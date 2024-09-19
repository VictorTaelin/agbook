module Bend.Parser.try-consume-exactly where

open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Parser.alternative
open import Bend.Parser.consume-exactly
open import Data.Bool.Type
open import Data.String.Type

try-consume-exactly : String → Parser Bool
try-consume-exactly target = do
  (consume-exactly target >> (pure True)) <|> (pure False)
