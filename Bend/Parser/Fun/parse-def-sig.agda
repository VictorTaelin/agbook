module Bend.Parser.Fun.parse-def-sig where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.List.List
open import Base.List.foldr
open import Base.List.unzip
open import Base.Pair.Pair
open import Base.String.String
open import Bend.Fun.Type.Type

open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.alternative

open import Bend.Parser.Fun.parse-type-term
open import Bend.Parser.consume
open import Bend.Parser.list-like
open import Bend.Parser.parse-name
open import Bend.Parser.parse-top-level-name
open import Bend.Parser.try-consume

-- Parses the type signature of a function definition.
-- = The function name, a list of named arguments and the function type.
parse-def-sig : Parser (Pair String (Pair (List String) Type))
parse-def-sig = do
  has-parens <- try-consume "("
  name , args , ret <- if has-parens then (do
      name <- parse-top-level-name
      args <- list-like parse-def-sig-arg "" ")" "" False 0
      consume ":"
      typ <- parse-type-term
      pure (name , args , typ))
    else do
      name <- parse-top-level-name
      args <- list-like parse-def-sig-arg "" ":" "" False 0
      typ <- parse-type-term
      pure (name , args , typ)
  let args , arg-types = unzip args
  let typ = foldr Arr ret arg-types
  pure (name , args , typ)

  where

  -- Parses a single argument in a function signature.
  -- = The argument name and its type (Any if no type is specified).
  parse-def-sig-arg : Parser (Pair String Type)
  parse-def-sig-arg = do
    has-parens <- try-consume "("
    if has-parens then (do
        name <- parse-name "function argument"
        typ <- (consume ":" >> parse-type-term) <|> pure Any
        consume ")"
        pure (name , typ))
      else do
        name <- parse-name "function argument"
        pure (name , Any)
