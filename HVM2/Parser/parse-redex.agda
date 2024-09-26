module HVM2.Parser.parse-redex where

open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.skip-trivia
open import Base.Parser.Parser
open import Base.Parser.consume
open import HVM2.Parser.parse-term
open import HVM2.Redex.Redex
open import HVM2.Term.Term

parse-redex : Parser Redex
parse-redex = do
  skip-trivia
  consume "&"
  lft <- parse-term
  skip-trivia
  consume "~"
  rgt <- parse-term
  pure (MkRedex lft rgt)
