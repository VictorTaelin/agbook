module Imp.Notation where

open import Imp.Type
open import Data.Nat.Type

_>>_ : Stmt → Stmt → Stmt
_>>_ = Then

-- Expressions

infix 100 ↑_
↑_ : Nat -> Expr
↑_ = Var

infix 50 _+_ _-_ _*_ _/_ _%_
infix 40 _&&_ _||_ _==_ _<_

_+_ : Expr → Expr → Expr
_+_ = Add

_-_ : Expr → Expr → Expr
_-_ = Sub

_*_ : Expr → Expr → Expr
_*_ = Mul

_/_ : Expr → Expr → Expr
_/_ = Div

_%_ : Expr → Expr → Expr
_%_ = Mod

_&&_ : Expr → Expr → Expr
_&&_ = And

_||_ : Expr → Expr → Expr
_||_ = Or

~_ : Expr → Expr
~_ = Not

_==_ : Expr → Expr → Expr
_==_ = Eq

_<_ : Expr → Expr → Expr
_<_ = Lt

infix 30 cond_then_else_
cond_then_else_ : Expr → Expr → Expr → Expr
cond_then_else_ = Cond

-- Statements

infix 20 _:l=_ _:s=_ _:g=_

_:l=_ : Nat → Expr → Stmt
_:l=_ = LSet

_:s=_ : Nat → Expr → Stmt
_:s=_ = SSet

_:g=_ : Nat → Expr → Stmt
_:g=_ = GSet

if_then_else_ : Expr → Stmt → Stmt → Stmt
if_then_else_ = If

while_go_ : Expr -> Stmt -> Stmt
while_go_ = While

infix 10 return_
return_ : Expr → Stmt
return_ = Ret

break : Stmt
break = Break

continue : Stmt
continue = Cont
