module Bend.Fun.Pattern.show where

open import Base.Maybe.Maybe
open import Base.String.String
open import Base.String.append
open import Base.String.join
open import Base.List.List
open import Base.List.map
open import Base.Nat.Trait.Show
open import Base.String.Trait.Show
open import Base.Trait.Show
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.FanKind.FanKind
open import Bend.Fun.show-bind

instance
  {-# TERMINATING #-} -- FIXME!
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
