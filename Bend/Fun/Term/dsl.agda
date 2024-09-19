module Bend.Fun.Term.dsl where

open import Bend.Fun.Term.Type
open import Bend.Fun.Pattern.Type as P
open import Bend.Fun.FanKind.Type as Fan
open import Bend.Fun.Op.Type
open import Bend.Fun.Num.Type renaming (Num to Num')
open import Base.Function.case
open import Base.Maybe.Type
open import Base.String.Type
open import Base.String.append
open import Base.List.Type renaming (List to List')
open import Base.Nat.Type
open import Base.Int.Type
open import Base.Float.Type

-- Embedded DSL for Bend Fun terms

-- Lambda
λ' : Pattern → Term → Term
λ' = Lam

-- Variable
v' : String → Term
v' x = Var x

-- Link
v'$ : String → Term
v'$ = Link

-- Erasure
*' : Term
*' = Era

-- Superposition
sup : List' Term → Term
sup = Fan Fan.Dup

-- Tuple
tup : List' Term → Term
tup = Fan Fan.Tup

-- Application
_$_ : Term → Term → Term
f $ x = App f x

infixl 5 _$_

-- Let bindings
let'_:=_in'_ : Pattern → Term → Term → Term
let'_:=_in'_ = Let

-- Numbers
#u : Nat → Term
#u n = Num (U24 n)

#i : Int → Term
#i n = Num (I24 n)

#f : Float → Term
#f n = Num (F24 n)

-- Operations
+ : Term → Term → Term
+ x y = Oper Add x y

- : Term → Term → Term
- x y = Oper Sub x y

* : Term → Term → Term
* x y = Oper Mul x y

/ : Term → Term → Term
/ x y = Oper Div x y

% : Term → Term → Term
% x y = Oper Rem x y

== : Term → Term → Term
== x y = Oper Eql x y

!= : Term → Term → Term
!= x y = Oper Neq x y

< : Term → Term → Term
< x y = Oper Ltn x y

> : Term → Term → Term
> x y = Oper Gtn x y

<= : Term → Term → Term
<= x y = Oper Lte x y

>= : Term → Term → Term
>= x y = Oper Gte x y

&& : Term → Term → Term
&& x y = Oper And x y

|| : Term → Term → Term
|| x y = Oper Or x y

^ : Term → Term → Term
^ x y = Oper Xor x y

<< : Term → Term → Term
<< x y = Oper Shl x y

>> : Term → Term → Term
>> x y = Oper Shr x y

** : Term → Term → Term
** x y = Oper Pow x y

-- Switch
switch'_:=_in'_ : Maybe String → Term → List' Term → Term
switch'_:=_in'_ bnd arg arms = do
  let pred = case bnd of λ where
    (Some bnd) → Some (bnd ++ "-1")
    None → None
  Swt bnd arg [] [] pred arms

-- Pattern syntax
p' : String → Pattern
p' x = P.Var (Some x)

p'* : Pattern
p'* = P.Var None

p'$ : String → Pattern
p'$ = P.Chn

p'tup : List' Pattern → Pattern
p'tup = P.Fan Fan.Tup

p'dup : List' Pattern → Pattern
p'dup = P.Fan Fan.Dup
