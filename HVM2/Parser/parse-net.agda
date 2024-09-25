module HVM2.Parser.parse-net where

open import Base.List.Type
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.parse-many
open import Base.Parser.skip-trivia
open import Base.Parser.Type
open import HVM2.Net.Type
open import HVM2.Parser.parse-redex
open import HVM2.Parser.parse-term
open import HVM2.Redex.Type
open import HVM2.Term.Type

parse-net : Parser Net
parse-net = do
  root ← parse-term
  rbag ← parse-many parse-redex
  pure (MkNet rbag root)
