module Bend.Parser.Fun.parse-pattern where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Char.to-nat
open import Base.Maybe.Maybe
open import Base.List.List
open import Bend.Fun.Num.Num renaming (Num to Num')
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.FanKind.FanKind
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.fail
open import Base.Parser.alternative
open import Base.Parser.parse-quoted-char
open import Base.Parser.parse-string
open import Bend.Parser.consume
open import Bend.Parser.try-consume
open import Bend.Parser.skip-trivia
open import Bend.Parser.list-like
open import Bend.Parser.parse-var-name
open import Bend.Parser.parse-name
open import Bend.Parser.parse-number

{-# TERMINATING #-} -- FIXME!
-- Parses a Fun syntax variable binding / pattern matching pattern.
-- = The parsed pattern.
parse-pattern : Parser Pattern
parse-pattern = do
  skip-trivia
  parse-pat-ctr-or-tup <|>
    parse-pat-dup <|>
    parse-pat-lst <|>
    parse-pat-str <|>
    parse-pat-char <|>
    parse-pat-num <|>
    parse-pat-chn <|>
    parse-pat-era <|>
    parse-pat-var <|>
    (fail "Expected pattern")

  where

  parse-pat-var : Parser Pattern
  parse-pat-var = do
    nam <- parse-var-name
    pure (Var (Some nam))

  parse-pat-str : Parser Pattern
  parse-pat-str = do
    str <- parse-string
    pure (Str str)

  parse-pat-num : Parser Pattern
  parse-pat-num = do
    num <- parse-number
    case num of λ where
      (U24 n) → pure (Num n)
      (I24 n) → fail "Only unsigned integers are supported in pattern matching"
      (F24 n) → fail "Only unsigned integers are supported in pattern matching"

  parse-pat-lst : Parser Pattern
  parse-pat-lst = do
    elements <- list-like parse-pattern "[" "]" ","  False 0
    pure (Lst elements)

  parse-pat-era : Parser Pattern
  parse-pat-era = do
    consume "*"
    pure (Var None)

  parse-pat-dup : Parser Pattern
  parse-pat-dup = do
    els <- list-like parse-pattern "{" "}" "," False 2
    pure (Fan FanKind.Dup els)

  parse-tup : Pattern → Parser Pattern
  parse-tup head = do
    tail <- list-like parse-pattern "" ")" "," True 1
    pure (Fan FanKind.Tup (head :: tail))

  parse-ctr : Pattern → Parser Pattern
  parse-ctr (Var (Some name)) = do
    args <- list-like parse-pattern "" ")" "" False 0
    pure (Ctr name args)
  parse-ctr _ = fail "Expected constructor name"

  parse-pat-ctr-or-tup : Parser Pattern
  parse-pat-ctr-or-tup = do
    consume "("
    head <- parse-pattern
    is-tup <- try-consume ","
    if is-tup
      then parse-tup head
      else parse-ctr head

  parse-pat-chn : Parser Pattern
  parse-pat-chn = do
    consume "$"
    name <- parse-name "unscoped variable"
    pure (Chn name)

  parse-pat-char : Parser Pattern
  parse-pat-char = do
    char <- parse-quoted-char
    pure (Num (to-nat char))
