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
open import Bend.Parser.parse-top-level-name
open import Bend.Parser.parse-restricted-name
open import Bend.Parser.Fun.parse-term
open import Bend.Parser.Fun.parse-type-term
open import Bend.Parser.Fun.parse-rule-lhs
open import Bend.Parser.parse-keyword
open import Bend.Fun.Type.Type
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.Term.Term using (Term)
open import Bend.Source.from-file-span
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

parse-fn-def : Parser FnDef
parse-fn-def = do
  skip-trivia
  ini-idx <- get-index
  let p-check dflt =
        (parse-keyword "checked" >> pure True) <|>
        (parse-keyword "unchecked" >> pure False) <|>
        pure dflt
  sig <- (parse-def-sig >>= (λ x → pure (Some x))) <|> pure None
  case sig of λ where
    (Some (name , args , typ)) → do
      check <- p-check True
      is-single-rule <- try-consume "="
      if is-single-rule
        then (do
          -- Single rule with signature
          body <- parse-term
          let pats = map (λ nam → Pattern.Var (Some nam)) args
          let rules = MkRule pats body :: []
          end-idx <- get-index
          let source = from-file-span ini-idx end-idx
          pure (MkFnDef name typ check rules source))
        else do
          -- Multiple rules with signature
          rules <- parse-rules name
          end-idx <- get-index
          let source = from-file-span ini-idx end-idx
          pure (MkFnDef name typ check rules source)
    None → do
      -- No signature, parse rules directly
      check <- p-check False
      name , pats <- parse-rule-lhs None
      body <- parse-term
      let rule = MkRule pats body
      rules <- parse-rules name
      end-idx <- get-index
      let source = from-file-span ini-idx end-idx
      pure (MkFnDef name Type.Any check (rule :: rules) source)

  where

  parse-def-sig-arg : Parser (Pair String Type)
  parse-def-sig-arg = do
    has-parens <- try-consume "("
    if has-parens then (do
        name <- parse-restricted-name "function argument"
        typ <- (consume ":" >> parse-type-term) <|> pure Any
        consume ")"
        pure (name , typ))
      else do
        name <- parse-restricted-name "function argument"
        pure (name , Any)

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

  parse-rules : String → Parser (List Rule)
  parse-rules name = do
    let p-rule = do
      name , pats <- parse-rule-lhs (Some name)
      body <- parse-term
      tail <- parse-rules name
      pure (MkRule pats body :: tail)
    p-rule <|> pure []
