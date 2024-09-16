module Imp.Notation where

open import Data.String.Type
open import Imp.Expr.Type
open import Imp.Stmt.Type
open import Data.Nat.Type


-- Monatic then notation for `do` blocks.
_>>_ = Then

-- Expressions

-- Local variable access
infix 100 ↑_
↑_ = Var

-- Numeric operations
infix 50 _+_ _-_ _*_ _/_ _%_ _&&_ _||_ !_

_+_ = Add
_-_ = Sub
_*_ = Mul
_/_ = Div
_%_ = Mod
_&&_ = And
_||_ = Or
!_ = Not

-- Comparisons
infix 40 _==_ _!=_ _<_ _<=_ _>_ _>=_

_==_ = Eq
_!=_ = Eq
_<_ = Lt
_<=_ = Le
_>_ = Gt
_>=_ = Ge

-- Conditionals
infix 30 cond_then_else_

cond_then_else_ : Expr → Expr → Expr → Expr
cond_then_else_ = Cond

-- Statements

-- Assignments
infix 20 _:=_ _s=_ _g=_

_:=_ = LSet
_s=_ = SSet
_g=_ = GSet

-- Convenience Assignments
infix 20 _+=_ _-=_

_+=_ : String → Expr → Stmt
_+=_ v x = LSet v (Add (Var v) x)

_-=_ : String → Expr → Stmt
_-=_ v x = LSet v (Sub (Var v) x)

-- Control flow
infix 5 if_then_ elif_then_ else_ while_go_

if_then_ : Expr → Stmt → Stmt
if_then_ = If

elif_then_ : Expr → Stmt → Stmt
elif_then_ = ElseIf

else_ : Stmt → Stmt
else_ = Else

while_go_ : Expr -> Stmt -> Stmt
while_go_ = While

-- Exceptional control flow

infix 15 return_

return_ : Expr → Stmt
return_ = Ret

break : Stmt
break = Break

continue : Stmt
continue = Cont
