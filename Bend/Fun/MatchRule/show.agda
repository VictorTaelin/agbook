open import Data.Trait.Show
open import Bend.Fun.Term.Type using (Term)

module Bend.Fun.MatchRule.show (TShow : Show Term) where

open import Bend.Fun.Pattern.Type
open import Bend.Fun.show-bind
open import Data.Bool.if
open import Data.String.Type
open import Data.String.append
open import Data.String.join
open import Data.String.eq
open import Data.List.Type
open import Data.List.map
open import Data.Maybe.Type
import Bend.Fun.MatchRule.Type as MatchRule'

private
  open module MatchRule = MatchRule' Term

instance
  ShowMatchRule : Show MatchRule
  ShowMatchRule = record { to-string = show-match-rule }
    where
      show-match-rule : MatchRule → String
      show-match-rule (MkMatchRule name binds body) =
        let binds-str = join " " (map show-bind binds)
        in name ++ (if binds-str == "" then "" else " " ++ binds-str) ++ ": " ++ show {{TShow}} body
