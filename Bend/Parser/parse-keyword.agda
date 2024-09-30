module Bend.Parser.parse-keyword where

open import Base.String.String
open import Base.String.append
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.fail
open import Base.Unit.Unit
open import Base.Bool.if
open import Bend.Parser.starts-with-keyword
open import Bend.Parser.consume

parse-keyword : String → Parser Unit
parse-keyword keyword = do
  is-kw <- starts-with-keyword keyword
  if is-kw then 
      consume keyword 
    else
      fail ("Expected keyword" ++ keyword)
