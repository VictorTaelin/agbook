module Bend.Parser.Fun.parse-term where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Bool.or
open import Base.Char.is-digit
open import Base.List.List
open import Base.List.foldl
open import Base.List.unzip
open import Base.List.reverse
open import Base.String.String
open import Base.String.append
open import Base.Maybe.Maybe
open import Base.Maybe.fold
open import Base.Nat.Nat
open import Base.Nat.Trait.Show
open import Base.Pair.Pair
open import Base.Trait.Show
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.FanKind.FanKind
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.fail
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.peek-one
open import Base.Parser.alternative
open import Base.Parser.parse-string
open import Base.Parser.starts-with
open import Bend.Parser.consume
open import Bend.Parser.try-consume
open import Bend.Parser.first-with-guard
open import Bend.Parser.skip-trivia
open import Bend.Parser.starts-with-keyword
open import Bend.Parser.parse-restricted-name
open import Bend.Parser.parse-var-name
open import Bend.Parser.parse-number
open import Bend.Parser.parse-keyword
open import Bend.Parser.parse-oper
open import Bend.Parser.list-like
open import Bend.Parser.sep-by
open import Bend.Parser.Fun.parse-pattern
import Bend.Fun.Op.Op as Op
import Bend.Fun.MatchRule.MatchRule as MatchRule'

private
  open module MatchRule = MatchRule' Term

parse-term : Parser Term
parse-term = do
  skip-trivia
  let starts-with-lam = do
    is-lam <- starts-with "λ"
    is-at <- starts-with "@"
    pure (is-lam || is-at)
  first-with-guard (
          (starts-with-lam , parse-lambda)
        :: (starts-with "(" , parse-parens)
        :: (starts-with "{" , parse-sup)
        :: (starts-with "[" , parse-list)
        :: (starts-with "\"" , parse-str-term)
        :: (starts-with "let" , parse-let)
        :: (starts-with "use" , parse-use)
        :: (starts-with "ask" , parse-ask)
        :: (starts-with "match" , parse-match)
        :: (starts-with "switch" , parse-switch)
        :: (starts-with "fold" , parse-fold)
        :: (starts-with "bend" , parse-bend)
        :: (starts-with "open" , parse-open)
        :: (starts-with "$" , parse-link)
        :: (starts-with "*" , pure Era)
        :: []) parse-num-or-var

  where

  parse-name-or-era : Parser (Maybe String)
  parse-name-or-era =
    (consume "*" >> pure None) <|>
    (parse-var-name >>= λ nam -> pure (Some nam))

  parse-lambda : Parser Term
  parse-lambda = do
    consume "λ" <|> consume "@" <|> fail "Expected 'λ' or '@'"
    pat <- parse-pattern
    bod <- parse-term
    pure (Lam pat bod)

  parse-tup : Term -> Parser Term
  parse-tup head = do
    tail <- list-like parse-term "" ")" "," True 1
    pure (Fan FanKind.Tup (head :: tail))

  parse-app : Term -> Parser Term
  parse-app head = do
    tail <- list-like parse-term "" ")" "" False 0
    let term = foldl App head tail
    pure term

  parse-parens : Parser Term
  parse-parens = do
    consume "("
    opr <- (parse-oper >>= λ opr -> pure (Some opr)) <|> pure None
    is-tup <- try-consume ","
    case opr , is-tup of λ where
      -- (*, ...) is a tuple
      (Some Op.Mul , True)  -> parse-tup Era
      (Some _      , True)  -> fail "Expected term"
      (Some opr    , False) -> do
        fst <- parse-term
        snd <- parse-term
        consume ")"
        pure (Oper opr fst snd)
      (None        , _)     -> do
        head <- parse-term
        is-tup <- try-consume ","
        if is-tup
          then parse-tup head
          else parse-app head

  parse-sup : Parser Term
  parse-sup = do
    els <- list-like parse-term "{" "}" "," False 2
    pure (Fan FanKind.Dup els)

  parse-list : Parser Term
  parse-list = do
    els <- list-like parse-term "[" "]" "," False 0
    pure (List' els)

  parse-str-term : Parser Term
  parse-str-term = do
    str <- parse-string
    pure (Str str)

  parse-let : Parser Term
  parse-let = do
    parse-keyword "let"
    pat <- parse-pattern
    consume "="
    val <- parse-term
    try-consume ";"
    nxt <- parse-term
    pure (Let pat val nxt)

  parse-use : Parser Term
  parse-use = do
    parse-keyword "use"
    nam <- parse-var-name
    consume "="
    val <- parse-term
    try-consume ";"
    nxt <- parse-term
    pure (Use (Some nam) val nxt)

  parse-ask : Parser Term
  parse-ask = do
    parse-keyword "ask"
    pat <- parse-pattern
    consume "="
    val <- parse-term
    try-consume ";"
    nxt <- parse-term
    pure (Ask pat val nxt)

  -- An arg with non-optional name and optional value
  parse-named-arg : Parser (Pair (Maybe String) Term)
  parse-named-arg = do
    nam <- parse-restricted-name "argument name"
    has-arg <- try-consume "="
    if has-arg then (do
        arg <- parse-term
        pure (Some nam , arg))
      else pure (Some nam , Var nam)

  -- An arg with optional name and non-optional value
  parse-match-arg : Parser (Pair (Maybe String) Term)
  parse-match-arg = do
    arg <- parse-term
    has-bnd <- try-consume "="
    case (arg , has-bnd) of λ where
      (Var bnd , True) -> do
        arg <- parse-term
        pure (Some bnd , arg)
      (Var bnd , False) -> pure (Some bnd , arg)
      (_ , True) -> fail "Expected argument name"
      (_ , False) -> pure (Some "%arg" , arg)

  parse-match-with : Parser (List (Pair (Maybe String) Term))
  parse-match-with = do
    let clause = do
      parse-keyword "with"
      sep-by parse-named-arg "," 1
    clause <|> pure []

  parse-match-arm : Parser MatchRule
  parse-match-arm = do
    try-consume "|"
    skip-trivia
    nam <- parse-name-or-era
    consume ":"
    bod <- parse-term
    pure (MkMatchRule nam [] bod)

  parse-match : Parser Term
  parse-match = do
    parse-keyword "match"
    bnd , arg <- parse-match-arg
    with' <- parse-match-with
    let with-bnd , with-arg = unzip with'
    arms <- list-like parse-match-arm "{" "}" ";" False 1
    pure (Mat bnd arg with-bnd with-arg arms)

  parse-switch-arms : Nat -> List Term -> Parser (Pair Nat (List Term))
  parse-switch-arms n acc = do
    try-consume "|"
    let pred = do
      consume "_"
      consume ":"
      term <- parse-term
      try-consume ";"
      pure (n , term :: acc)
    let num = do
      consume (show n)
      consume ":"
      term <- parse-term
      try-consume ";"
      parse-switch-arms (Succ n) (term :: acc)
    num <|> pred <|> fail "Expected switch arm"

  parse-switch : Parser Term
  parse-switch = do
    parse-keyword "switch"
    bnd , arg <- parse-match-arg
    with' <- parse-match-with
    let with-bnd , with-arg = unzip with'
    consume "{"
    (pred , arms) <- parse-switch-arms 0 []
    consume "}"
    let arms = reverse arms
    let pred = fold None (λ bnd -> Some (bnd ++ "-" ++ (show pred))) bnd
    pure (Swt bnd arg with-bnd with-arg pred arms)

  parse-fold : Parser Term
  parse-fold = do
    parse-keyword "fold"
    bnd , arg <- parse-match-arg
    with' <- parse-match-with
    let with-bnd , with-arg = unzip with'
    arms <- list-like parse-match-arm "{" "}" ";" False 1
    pure (Fold bnd arg with-bnd with-arg arms)

  parse-bend : Parser Term
  parse-bend = do
    parse-keyword "bend"
    args <- list-like parse-named-arg "" "{" "," False 1
    let bnd , arg = unzip args
    skip-trivia
    parse-keyword "when"
    cond <- parse-term
    consume ":"
    step <- parse-term
    skip-trivia
    parse-keyword "else"
    consume ":"
    base <- parse-term
    consume "}"
    pure (Bend bnd arg cond step base)

  parse-open : Parser Term
  parse-open = do
    parse-keyword "open"
    skip-trivia
    typ <- parse-restricted-name "type"
    skip-trivia
    var <- parse-var-name
    try-consume ";"
    bod <- parse-term
    pure (Open typ var bod)

  parse-link : Parser Term
  parse-link = do
    consume "$"
    nam <- parse-restricted-name "unscoped variable"
    pure (Link nam)

  parse-num-or-var : Parser Term
  parse-num-or-var = do
    head <- peek-one
    case head of λ where
      (Some c) ->  if is-digit c then (do
                    num <- parse-number
                    pure (Num num))
                  else do
                    var <- parse-var-name
                    pure (Var var)
      None -> fail "Expected term"
