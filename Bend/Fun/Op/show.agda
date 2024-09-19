module Bend.Fun.Op.show where

open import Bend.Fun.Op.Type
open import Base.String.Type
open import Base.Trait.Show

instance
  ShowOp : Show Op
  ShowOp = record { to-string = show-op }
    where
      show-op : Op → String
      show-op Add = "+"
      show-op Sub = "-"
      show-op Mul = "*"
      show-op Div = "/"
      show-op Rem = "%"
      show-op Eql = "=="
      show-op Neq = "!="
      show-op Ltn = "<"
      show-op Gtn = ">"
      show-op Lte = "<="
      show-op Gte = ">="
      show-op And = "&"
      show-op Or  = "|"
      show-op Xor = "^"
      show-op Shl = "<<"
      show-op Shr = ">>"
      show-op Pow = "**"
