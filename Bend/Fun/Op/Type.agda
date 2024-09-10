module Bend.Fun.Op.Type where

data Op : Set where
  Add : Op
  Sub : Op
  Mul : Op
  Div : Op
  Rem : Op
  Eql : Op
  Neq : Op
  Ltn : Op
  Gtn : Op
  Lte : Op
  Gte : Op
  And : Op
  Or  : Op
  Xor : Op
  Shl : Op
  Shr : Op
  Pow : Op
