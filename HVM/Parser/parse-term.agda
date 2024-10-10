module HVM.Parser.parse-term where

open import Base.Bits.Bits
open import Base.Bool.or
open import Base.Char.is-alpha
open import Base.Char.is-digit
open import Base.Function.id
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.Parser
open import Base.Parser.alternative
open import Base.Parser.consume
open import Base.Parser.parse-name
open import Base.Parser.skip-trivia
open import Base.String.String
open import HVM.Addr.Addr
open import HVM.Term.Term

{-# TERMINATING #-}
parse-term : Parser Term
parse-term = do
  skip-trivia
  parse-var <|> parse-era <|> parse-con <|> parse-dup

  where

  parse-var : Parser Term
  parse-var = do
    name ← parse-name
    pure (Var name (Root E))  -- Use a default Addr for now

  parse-era : Parser Term
  parse-era = do
    consume "*"
    pure Era

  parse-con : Parser Term
  parse-con = do
    consume "("
    p1 ← parse-term
    p2 ← parse-term
    consume ")"
    pure (Con p1 p2)

  parse-dup : Parser Term
  parse-dup = do
    consume "{"
    p1 ← parse-term
    p2 ← parse-term
    consume "}"
    pure (Dup p1 p2)

