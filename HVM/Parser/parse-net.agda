module HVM.Parser.parse-net where

open import Base.List.List
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.parse-many
open import Base.Parser.skip-trivia
open import Base.Parser.Parser
open import HVM.Net.Net
open import HVM.Parser.parse-redex
open import HVM.Parser.parse-term
open import HVM.Redex.Redex
open import HVM.Mode.Mode
open import HVM.Term.Term

parse-net : Parser (Net NAMED)
parse-net = do
  root ← parse-term
  rbag ← parse-many parse-redex
  pure (MkNet root rbag)
