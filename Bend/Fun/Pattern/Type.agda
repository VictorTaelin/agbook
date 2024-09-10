module Bend.Fun.Pattern.Type where

open import Data.List.Type
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.String.Type
open import Bend.Fun.FanKind.Type

data Pattern : Set where
  Var : Maybe String → Pattern
  Chn : String → Pattern
  Ctr : String → List Pattern → Pattern
  Num : Nat → Pattern
  Fan : FanKind → List Pattern → Pattern
  Lst : List Pattern → Pattern
  Str : String → Pattern