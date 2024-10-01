module Bend.Parser.Fun.parse-fn-def where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Maybe.Maybe
open import Base.List.List
open import Base.List.unzip
open import Base.List.foldr
open import Base.List.map
open import Base.Pair.Pair
open import Base.String.String
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.get-index
open import Base.Parser.alternative
open import Bend.Parser.consume
open import Bend.Parser.try-consume
open import Bend.Parser.list-like
open import Bend.Parser.skip-trivia
open import Bend.Parser.Fun.parse-def-sig
open import Bend.Parser.Fun.parse-rule-lhs
open import Bend.Parser.Fun.parse-term
open import Bend.Parser.parse-keyword
open import Bend.Fun.Type.Type
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.Term.Term using (Term)
open import Bend.Source.from-file-span
import Base.Parser.map as Parser
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

-- Parses a Fun syntax function definition.
-- Handles both single-rule and multi-rule function definitions,
-- with or without type signatures.
-- = A new FnDef with the parsed function definition.
parse-fn-def : Parser FnDef
parse-fn-def = do
  skip-trivia
  ini-idx <- get-index
  let p-check dflt =
        (parse-keyword "checked" >> pure True) <|>
        (parse-keyword "unchecked" >> pure False) <|>
        pure dflt
  sig <- (Parser.map Some parse-def-sig) <|> pure None
  case sig of λ where
    (Some (name , args , typ)) → do
      check <- p-check True
      is-single-rule <- try-consume "="
      if is-single-rule
        then (do
          -- Single rule with signature
          body      <- parse-term
          let pats   = map (λ nam → Pattern.Var (Some nam)) args
          let rules  = MkRule pats body :: []
          end-idx   <- get-index
          let source = from-file-span ini-idx end-idx
          pure (MkFnDef name typ check rules source))
        else do
          -- Multiple rules with signature
          rules     <- parse-rules name
          end-idx   <- get-index
          let source = from-file-span ini-idx end-idx
          pure (MkFnDef name typ check rules source)
    None → do
      -- No signature, parse rules directly
      check       <- p-check False
      name , pats <- parse-rule-lhs None
      body        <- parse-term
      let rule     = MkRule pats body
      rules       <- parse-rules name
      end-idx     <- get-index
      let source   = from-file-span ini-idx end-idx
      pure (MkFnDef name Type.Any check (rule :: rules) source)

  where

  -- Parses multiple rules for a function.
  -- This is used for function definitions with multiple pattern-matching rules.
  -- - name: The expected name of the function being defined.
  -- = A list of pattern matching rules.
  parse-rules : String → Parser (List Rule)
  parse-rules name = do
    let p-rule = do
      name , pats <- parse-rule-lhs (Some name)
      body <- parse-term
      tail <- parse-rules name
      pure (MkRule pats body :: tail)
    p-rule <|> pure []
