module Bend.Parser.try-parse-keyword where

open import Base.String.Type
open import Base.Parser.Type
open import Base.Parser.bind
open import Base.Parser.fail
open import Base.Parser.pure
open import Base.Bool.Type
open import Base.Bool.if
open import Bend.Parser.starts-with-keyword
open import Bend.Parser.consume

try-parse-keyword : String → Parser Bool
try-parse-keyword keyword = do
  is-kw ← starts-with-keyword keyword
  if is-kw then consume keyword >> pure True else pure False
