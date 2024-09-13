module Bend.Net.NodeKind.Type where

open import Data.String.Type
open import Data.Bits.Type

data NodeKind : Set where
  Rot : NodeKind
  Era : NodeKind
  Con : NodeKind
  Dup : NodeKind
  Var : NodeKind
  Ref : String → NodeKind
  Num : Bits → NodeKind
  Opr : NodeKind
  Swi : NodeKind
