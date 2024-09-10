module Bend.Fun.Type.Type where

open import Data.List.Type
open import Data.String.Type

data Type : Set where
  Any : Type
  Hole : Type
  Var  : String → Type
  Arr  : Type → Type → Type
  Ctr  : String → List Type → Type
  Tup  : List Type → Type
  U24  : Type
  I24  : Type
  F24  : Type
  None : Type
  Number : Type → Type
  Integer : Type → Type
