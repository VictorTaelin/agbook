module Bend.Fun.Pattern.Type where

open import Data.List.Type
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.String.Type
open import Bend.Fun.FanKind.Type

-- Represents a variable bind pattern that introduces one or more variables to the scope
-- and potentially pattern matches on the given value depending on the variant
data Pattern : Set where
  Var : (nam : Maybe String) → Pattern
  Chn : (nam : String) → Pattern
  Ctr : (nam : String) → (args : List Pattern) → Pattern
  Num : (val : Nat) → Pattern
  Fan : (kind : FanKind) → (els : List Pattern) → Pattern
  Lst : (els : List Pattern) → Pattern
  Str : (val : String) → Pattern
