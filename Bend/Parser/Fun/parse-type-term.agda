module Bend.Parser.Fun.parse-type-term where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Maybe.Maybe
open import Base.List.List
open import Base.String.String
open import Bend.Fun.Type.Type
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.alternative
open import Base.Parser.fail
open import Base.Parser.peek-one
open import Bend.Parser.consume
open import Bend.Parser.try-consume
open import Bend.Parser.sep-by
open import Bend.Parser.list-like
open import Bend.Parser.skip-trivia
open import Bend.Parser.parse-restricted-name
open import Bend.Parser.parse-keyword

parse-type-term : Parser Type
parse-type-term = do
  left <- parse-type-atom
  is-arr <- try-consume "→"
  if is-arr then (do
      right <- parse-type-term
      pure (Arr left right))
    else
      pure left

  where mutual

  parse-type-atom : Parser Type
  parse-type-atom = do
    skip-trivia
    parse-any <|>
      parse-none <|>
      parse-hole <|>
      parse-u24 <|>
      parse-i24 <|>
      parse-f24 <|>
      parse-parenthesized <|>
      parse-var

  parse-any : Parser Type
  parse-any = do
    parse-keyword "Any"
    pure Any

  parse-none : Parser Type
  parse-none = do
    parse-keyword "None"
    pure None

  parse-hole : Parser Type
  parse-hole = do
    parse-keyword "_"
    pure Hole

  parse-u24 : Parser Type
  parse-u24 = do
    parse-keyword "u24"
    pure U24

  parse-i24 : Parser Type
  parse-i24 = do
    parse-keyword "i24"
    pure I24

  parse-f24 : Parser Type
  parse-f24 = do
    parse-keyword "f24"
    pure F24

  parse-parenthesized : Parser Type
  parse-parenthesized = do
    consume "("
    head <- parse-type-term
    skip-trivia
    one <- peek-one
    case one of λ where
      (Some ')') → do
        consume ")"
        pure head
      (Some ',') → parse-tuple head
      _ → parse-constructor head

  parse-tuple : Type → Parser Type
  parse-tuple head = do
    consume ","
    tail <- sep-by parse-type-term "," 1
    consume ")"
    pure (Tup (head :: tail))

  parse-constructor : Type → Parser Type
  parse-constructor (Var nam) = do
    args <- list-like parse-type-term "" ")" "" False 1
    pure (Ctr nam args)
  parse-constructor _ = fail "Expected type constructor name"

  parse-var : Parser Type
  parse-var = do
    nam <- parse-restricted-name "type variable"
    pure (Var nam)
