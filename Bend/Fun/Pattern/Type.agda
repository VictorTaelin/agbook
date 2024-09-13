module Bend.Fun.Pattern.Type where

open import Data.List.Type
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.String.Type
open import Bend.Fun.FanKind.Type

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
