module Bend.Parser.Fun.parse-rule where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.String.String
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.alternative
open import Bend.Parser.consume
open import Bend.Parser.try-consume
open import Bend.Parser.skip-trivia
open import Bend.Parser.list-like
open import Bend.Parser.parse-keyword
open import Bend.Parser.parse-top-level-name
open import Bend.Parser.Fun.parse-pattern
open import Bend.Parser.Fun.parse-term
open import Bend.Fun.Term.Term
import Bend.Fun.Rule.Rule as Rule'

private
  open module Rule = Rule' Term

parse-rule : (Maybe String) → Parser (Pair String Rule)
parse-rule expected = do
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
  body <- parse-term
  pure (name , MkRule pats body)
