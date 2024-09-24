module Imp.Expr.show where

import Imp.Expr.Type as Expr'
open import Imp.Stmt.Type
open import Imp.Show.indented using (show-i-expr)
open import Base.String.Type

private
  open module Expr = Expr' Stmt

show : Expr -> String
show s = show-i-expr 0 s
