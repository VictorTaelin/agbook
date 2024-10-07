module Imp.Notation where

open import Imp.Expr.Expr
open import Imp.Stmt.Stmt
open import Base.Nat.Nat
open import Base.U64.from-nat
open import Base.String.String

--------------------------------------------------
-- Expressions

-- Local variable access
infix 100 $_
$_ = Var

-- Grid indices
tid = Tid
bid = Bid
gid = Gid

-- Numeric operations
infix 50 _+_ _-_ _*_ _/_ _%_ _&&_ _||_ !_

_+_  = Add
_-_  = Sub
_*_  = Mul
_/_  = Div
_%_  = Mod
_&&_ = And
_||_ = Or
!_   = Not

-- Comparisons
infix 40 _==_ _!=_ _<_ _<=_ _>_ _>=_

_==_ = Eq
_!=_ = Eq
_<_  = Lt
_<=_ = Le
_>_  = Gt
_>=_ = Ge

-- Conditionals
infix 30 cond_then_else_

cond_then_else_ : Expr → Expr → Expr → Expr
cond_then_else_ = Cond

--------------------------------------------------
-- Statements

-- Declarations

local_ = Locals

-- Assignments
infix 20 _:=_ shared[_]=_ global[_]=_

_:=_        = LSet
shared[_]=_ = SSet
global[_]=_ = GSet

-- Convenience Local Assignments
infix 20 _+=_ _-=_

_+=_ : String → Expr → Stmt
_+=_ v e = LSet v (Add (Var v) e)

_-=_ : String → Expr → Stmt
_-=_ v e = LSet v (Sub (Var v) e)

-- Control flow
infix 5 if_then_else_ while_go_

if_then_else_ = If
while_go_     = While

-- Monadic then notation for `do` blocks.
_>>_ = Then

--------------------------------------------------
-- Exceptional control flow

infix 15 return_ break continue ignore_ noop

return_  = Ret
break    = Break
continue = Cont
ignore_  = Ignore
noop     = Ignore (Num (from-nat 0))
