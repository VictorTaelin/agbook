module Bend.Fun.Type.Type where

open import Base.List.Type
open import Base.String.Type

-- Types of terms and functions in Bend.
data Type : Set where
  Any  : Type
  Hole : Type
  Var  : (nam : String) → Type
  Arr  : (dom : Type) → (cod : Type) → Type
  Ctr  : (nam : String) → (args : List Type) → Type
  Tup  : (els : List Type) → Type
  U24  : Type
  I24  : Type
  F24  : Type
  None : Type
  Num  : (t : Type) → Type
  Int  : (t : Type) → Type
