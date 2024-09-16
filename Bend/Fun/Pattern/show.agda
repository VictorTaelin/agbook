module Bend.Fun.Pattern.show where

open import Data.Maybe.Type
open import Data.String.Type
open import Data.String.append
open import Data.String.join
open import Data.List.Type
open import Data.List.map
open import Data.Nat.show
open import Data.String.show
open import Data.Trait.Show
open import Bend.Fun.Pattern.Type
open import Bend.Fun.FanKind.Type
open import Bend.Fun.show-bind

instance
  {-# TERMINATING #-}
  ShowPattern : Show Pattern
  ShowPattern = record { to-string = show-pattern }
    where
      show-pattern : Pattern → String
      show-pattern (Var nam) = show-bind nam
      show-pattern (Chn nam) = "$" ++ nam
      show-pattern (Fan FanKind.Tup els) = "(" ++ (join ", " (map show els)) ++ ")"
      show-pattern (Fan FanKind.Dup els) = "{" ++ (join " " (map show els)) ++ "}"
      show-pattern (Ctr nam []) = nam
      show-pattern (Ctr nam els) = "(" ++ nam ++ " " ++ join " " (map show els) ++ ")"
      show-pattern (Num val) = show val
      show-pattern (Lst els) = "[" ++ join ", " (map show els) ++ "]" 
      show-pattern (Str val) = "\"" ++ val ++ "\""
