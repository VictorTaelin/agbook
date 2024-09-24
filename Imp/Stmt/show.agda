module Imp.Stmt.show where

open import Imp.Stmt.Type
open import Imp.Show.indented using (show-i-stmt)
open import Base.String.Type

show : Stmt -> String
show s = show-i-stmt 0 s
