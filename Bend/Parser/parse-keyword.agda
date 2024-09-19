module Bend.Parser.parse-keyword where

open import Data.String.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.fail
open import Data.Unit.Type
open import Data.Bool.if
open import Bend.Parser.starts-with-keyword
open import Bend.Parser.consume

parse-keyword : String → Parser Unit
parse-keyword keyword = do
  is-kw ← starts-with-keyword keyword
  if is-kw then consume keyword else fail "Expected keyword"
