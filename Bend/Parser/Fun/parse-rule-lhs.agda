module Bend.Parser.Fun.parse-rule-lhs where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.String.String
open import Bend.Fun.Pattern.Pattern
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Bend.Parser.consume
open import Bend.Parser.try-consume
open import Bend.Parser.skip-trivia
open import Bend.Parser.list-like
open import Bend.Parser.parse-keyword
open import Bend.Parser.parse-top-level-name
open import Bend.Parser.Fun.parse-pattern

parse-rule-lhs : (Maybe String) → Parser (Pair String (List Pattern))
parse-rule-lhs expected = do
  let p-nam = case expected of λ where
    (Some name) → parse-keyword name >> pure name
    None → parse-top-level-name
  has-parens <- try-consume "("
  name , pats <- if has-parens
    then (do
      skip-trivia
      name <- p-nam
      pats <- list-like parse-pattern "" ")" "" False 0
      consume "="
      pure (name , pats))
    else do
      skip-trivia
      name <- p-nam
      pats <- list-like parse-pattern "" "=" "" False 0
      pure (name , pats)
  pure (name , pats)
