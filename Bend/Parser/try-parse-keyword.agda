module Bend.Parser.try-parse-keyword where

open import Base.String.String
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.fail
open import Base.Bool.Bool
open import Base.Bool.if
open import Bend.Parser.starts-with-keyword
open import Bend.Parser.consume

try-parse-keyword : String -> Parser Bool
try-parse-keyword keyword = do
  is-kw <- starts-with-keyword keyword
  if is-kw then consume keyword >> pure True else pure False
