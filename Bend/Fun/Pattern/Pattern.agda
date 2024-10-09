module Bend.Fun.Pattern.Pattern where

open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.String.String
open import Bend.Fun.FanKind.FanKind

-- Represents a variable bind pattern that introduces one or more variables to the scope
-- and potentially pattern matches on the given value depending on the variant
data Pattern : Set where
  Var : Maybe String → Pattern
  Chn : String → Pattern
  Fan : FanKind → List Pattern → Pattern
  Ctr : String → List Pattern → Pattern
  Num : Nat → Pattern
  Lst : List Pattern → Pattern
  Str : String → Pattern

