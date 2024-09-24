module Bend.Parser.Fun.parse-rule-lhs where

open import Base.Function.case
open import Base.Bool.Type
open import Base.Bool.if
open import Base.List.Type
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.String.Type
open import Bend.Fun.Pattern.Type
open import Base.Parser.Type
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Bend.Parser.consume
open import Bend.Parser.try-consume
open import Bend.Parser.skip-trivia
open import Bend.Parser.list-like
open import Bend.Parser.parse-keyword
open import Bend.Parser.parse-top-level-name
open import Bend.Parser.Fun.parse-pattern

parse-rule-lhs : (Maybe String) -> Parser (Pair String (List Pattern))
parse-rule-lhs expected = do
  let p-nam = case expected of λ where
    (Some name) -> parse-keyword name >> pure name
    None -> parse-top-level-name
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
