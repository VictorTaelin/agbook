module Bend.Net.NodeKind.NodeKind where

open import Base.String.String
open import Base.Bits.Bits

data NodeKind : Set where
  Rot : NodeKind
  Era : NodeKind
  Con : NodeKind
  Dup : NodeKind
  Var : NodeKind
  Ref : String -> NodeKind
  Num : Bits -> NodeKind
  Opr : NodeKind
  Swi : NodeKind
