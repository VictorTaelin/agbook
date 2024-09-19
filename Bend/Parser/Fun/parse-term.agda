module Bend.Parser.Fun.parse-term where

open import Base.Function.case
open import Base.Bool.Type
open import Base.Bool.if
open import Base.List.Type
open import Base.List.foldl
open import Base.List.unzip
open import Base.List.reverse
open import Base.String.Type
open import Base.String.append
open import Base.Maybe.Type
open import Base.Maybe.maybe
open import Base.Nat.Type
open import Base.Nat.show
open import Base.Pair.Type
open import Bend.Fun.Term.Type renaming (List to List')
open import Bend.Fun.FanKind.Type
open import Base.Parser.Type
open import Base.Parser.State
open import Base.Parser.fail
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.alternative
open import Base.Parser.parse-string
open import Bend.Parser.consume
open import Bend.Parser.try-consume
open import Bend.Parser.skip-trivia
open import Bend.Parser.starts-with-keyword
open import Bend.Parser.parse-restricted-name
open import Bend.Parser.parse-var-name
open import Bend.Parser.parse-number
open import Bend.Parser.list-like
open import Bend.Parser.sep-by
open import Bend.Parser.Fun.parse-pattern

import Bend.Fun.MatchRule.Type as MatchRule'

private
  open module MatchRule = MatchRule' Term

parse-term : Parser Term
parse-term = do
  skip-trivia
  parse-lambda <|>
    parse-parenthesized <|>
    parse-superposition <|>
    parse-list <|>
    parse-str-term <|>
    parse-num-term <|>
    parse-let <|>
    parse-use <|>
    parse-ask <|>
    parse-match <|>
    parse-switch <|>
    parse-fold <|>
    parse-bend <|>
    parse-open <|>
    parse-link <|>
    parse-var <|>
    fail "Expected term"
  
  where

  parse-name-or-era : Parser (Maybe String)
  parse-name-or-era =
    (consume "*" >> pure None) <|>
    (parse-var-name >>= λ nam → pure (Some nam))

  parse-lambda : Parser Term
  parse-lambda = do
    consume "λ" <|> consume "@" <|> fail "Expected 'λ' or '@'"
    pat ← parse-pattern
    bod ← parse-term
    pure (Lam pat bod)

  parse-tup : Term → Parser Term
  parse-tup head = do
    tail ← list-like parse-term "" ")" "," True 1
    pure (Fan FanKind.Tup (head :: tail))

  parse-app : Term → Parser Term
  parse-app head = do
    tail ← list-like parse-term "" ")" "" False 0
    let term = foldl App head tail
    pure term

  parse-parenthesized : Parser Term
  parse-parenthesized = do
    consume "("
    head ← parse-term
    is-tup ← try-consume ","
    if is-tup
      then parse-tup head
      else parse-app head

  parse-superposition : Parser Term
  parse-superposition = do
    consume "{"
    els ← list-like parse-term "{" "}" "," False 2
    pure (Fan FanKind.Dup els)

  parse-list : Parser Term
  parse-list = do
    els ← list-like parse-term "[" "]" "," False 0
    pure (List' els)

  parse-str-term : Parser Term
  parse-str-term = do
    str ← parse-string
    pure (Str str)

  parse-num-term : Parser Term
  parse-num-term = do
    num ← parse-number
    pure (Num num)

  parse-let : Parser Term
  parse-let = do
    consume "let"
    pat ← parse-pattern
    consume "="
    val ← parse-term
    try-consume ";"
    nxt ← parse-term
    pure (Let pat val nxt)

  parse-use : Parser Term
  parse-use = do
    consume "use"
    nam ← parse-var-name
    consume "="
    val ← parse-term
    try-consume ";"
    nxt ← parse-term
    pure (Use (Some nam) val nxt)

  parse-ask : Parser Term
  parse-ask = do
    consume "ask"
    pat ← parse-pattern
    consume "="
    val ← parse-term
    try-consume ";"
    nxt ← parse-term
    pure (Ask pat val nxt)

  -- An arg with non-optional name and optional value
  parse-named-arg : Parser (Pair (Maybe String) Term)
  parse-named-arg = do
    nam ← parse-var-name
    has-arg ← try-consume "="
    if has-arg then (do
        arg ← parse-term
        pure (Some nam , arg))
      else pure (Some nam , Var nam)

  -- An arg with optional name and non-optional value
  parse-match-arg : Parser (Pair (Maybe String) Term)
  parse-match-arg = do
    arg ← parse-term
    has-bnd ← try-consume "="
    case (arg , has-bnd) of λ where
      (Var bnd , True) → do
        arg ← parse-term
        pure (Some bnd , arg)
      (Var bnd , False) → pure (Some bnd , arg)
      (_ , True) → fail "Expected argument name"
      (_ , False) → pure (Some "%arg" , arg)

  parse-match-with : Parser (List (Pair (Maybe String) Term))
  parse-match-with = do
    let clause = do
      consume "with"
      sep-by parse-named-arg "," 1
    clause <|> pure []

  parse-match-arm : Parser MatchRule
  parse-match-arm = do
    try-consume "|"
    skip-trivia
    nam ← parse-name-or-era
    consume ":"
    bod ← parse-term
    pure (MkMatchRule nam [] bod)

  parse-match : Parser Term
  parse-match = do
    consume "match"
    bnd , arg ← parse-match-arg
    with' ← parse-match-with
    let with-bnd , with-arg = unzip with'
    arms ← list-like parse-match-arm "{" "}" ";" False 1
    pure (Mat bnd arg with-bnd with-arg arms)

  parse-switch-arms : Nat → List Term → Parser (Pair Nat (List Term))
  parse-switch-arms n acc = do
    try-consume "|"
    let pred = do
      consume "_"
      consume ":"
      term ← parse-term
      try-consume ";"
      pure (n , term :: acc)
    let num = do
      consume (show n)
      consume ":"
      term ← parse-term
      try-consume ";"
      parse-switch-arms (Succ n) (term :: acc)
    num <|> pred <|> fail "Expected switch arm"

  parse-switch : Parser Term
  parse-switch = do
    consume "switch"
    bnd , arg ← parse-match-arg
    with' ← parse-match-with
    let with-bnd , with-arg = unzip with'
    consume "{"
    (pred , arms) ← parse-switch-arms 0 []
    let arms = reverse arms
    let pred = maybe None (λ bnd → Some (bnd ++ "-" ++ (show pred))) bnd
    pure (Swt bnd arg with-bnd with-arg pred arms)

  parse-fold : Parser Term
  parse-fold = do
    consume "fold"
    bnd , arg ← parse-match-arg
    with' ← parse-match-with
    let with-bnd , with-arg = unzip with'
    arms ← list-like parse-match-arm "{" "}" ";" False 1
    pure (Fold None arg [] [] arms)

  parse-bend : Parser Term
  parse-bend = do
    consume "bend"
    args ← list-like parse-named-arg "" "{" "," False 1
    let bnd , arg = unzip args
    consume "when"
    cond ← parse-term
    consume ":"
    step ← parse-term
    consume "else"
    consume ":"
    base ← parse-term
    consume "}"
    pure (Bend bnd arg cond step base)

  parse-open : Parser Term
  parse-open = do
    consume "open"
    typ ← parse-restricted-name "type"
    var ← parse-var-name
    try-consume ";"
    bod ← parse-term
    pure (Open typ var bod)

  parse-link : Parser Term
  parse-link = do
    consume "$"
    nam ← parse-var-name
    pure (Link nam)

  parse-var : Parser Term
  parse-var = do
    nam ← parse-var-name
    pure (Var nam)
