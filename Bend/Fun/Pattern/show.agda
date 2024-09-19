module Bend.Fun.Pattern.show where

open import Base.Maybe.Type
open import Base.String.Type
open import Base.String.append
open import Base.String.join
open import Base.List.Type
open import Base.List.map
open import Base.Nat.show
open import Base.String.show
open import Base.Show.Trait
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
