module Bend.Parser.try-parse-keyword where

open import Data.String.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.fail
open import Data.Parser.pure
open import Data.Bool.Type
open import Data.Bool.if
open import Bend.Parser.starts-with-keyword
open import Bend.Parser.consume

try-parse-keyword : String → Parser Bool
try-parse-keyword keyword = do
  is-kw ← starts-with-keyword keyword
  if is-kw then consume keyword >> pure True else pure False
