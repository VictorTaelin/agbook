module Bend.Fun.dsl where

open import Bend.Source.Source
open import Bend.Source.SourceKind.SourceKind
open import Bend.Fun.Term.Term
open import Bend.Fun.Pattern.Pattern as P
open import Bend.Fun.FanKind.FanKind as Fan
open import Bend.Fun.Op.Op
open import Bend.Fun.Num.Num renaming (Num to Num')
open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.String.String
open import Base.String.append
open import Base.List.List renaming (List to List')
open import Base.List.length
open import Base.List.unzip
open import Base.List.map
open import Base.Pair.Pair
open import Base.Nat.Nat
open import Base.Nat.Trait.Show
open import Base.Nat.sub
open import Base.Int.Int
open import Base.F64.F64
open import Base.Bool.Bool
open import Base.Trait.Show
import Bend.Fun.Type.Type as T
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.Rule.Rule as Rule'
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module MatchRule = MatchRule' Term
  open module Rule = Rule' Term
  open module FnDef = FnDef' Term

-- Embedded DSL for Bend Fun terms

-- Lambda
λ' : Pattern -> Term -> Term
λ' = Lam

-- Variable
v' : String -> Term
v' x = Var x

-- Link
v'$ : String -> Term
v'$ = Link

-- Reference
ref' : String -> Term
ref' = Ref

-- Erasure
*' : Term
*' = Era

-- Superposition
sup : List' Term -> Term
sup = Fan Fan.Dup

-- Tuple
tup : List' Term -> Term
tup = Fan Fan.Tup

-- List
lst : List' Term -> Term
lst = List

-- String
str : String -> Term
str = Str

-- Application
_$_ : Term -> Term -> Term
f $ x = App f x

infixl 5 _$_

-- Let bindings
let'_:=_in'_ : Pattern -> Term -> Term -> Term
let'_:=_in'_ = Let

infix 2 let'_:=_in'_

-- Numbers
#u : Nat -> Term
#u n = Num (U24 n)

#i : Int -> Term
#i n = Num (I24 n)

#f : F64 -> Term
#f n = Num (F24 n)

-- Operations
+ : Term -> Term -> Term
+ x y = Oper Add x y

- : Term -> Term -> Term
- x y = Oper Sub x y

* : Term -> Term -> Term
* x y = Oper Mul x y

/ : Term -> Term -> Term
/ x y = Oper Div x y

% : Term -> Term -> Term
% x y = Oper Rem x y

== : Term -> Term -> Term
== x y = Oper Eql x y

!= : Term -> Term -> Term
!= x y = Oper Neq x y

< : Term -> Term -> Term
< x y = Oper Ltn x y

> : Term -> Term -> Term
> x y = Oper Gtn x y

<= : Term -> Term -> Term
<= x y = Oper Lte x y

>= : Term -> Term -> Term
>= x y = Oper Gte x y

&& : Term -> Term -> Term
&& x y = Oper And x y

|| : Term -> Term -> Term
|| x y = Oper Or x y

^ : Term -> Term -> Term
^ x y = Oper Xor x y

<< : Term -> Term -> Term
<< x y = Oper Shl x y

>> : Term -> Term -> Term
>> x y = Oper Shr x y

** : Term -> Term -> Term
** x y = Oper Pow x y

-- Switch
switch'_:=_with'_in'_ : Maybe String -> Term -> List' (Pair (Maybe String) Term) -> List' Term -> Term
switch' bnd := arg with' with-args in' arms = do
  let pred = case bnd of λ where
    (Some bnd) -> Some (bnd ++ "-" ++ show (sub (length arms) 1))
    None -> None
  let with-bnd , with-arg = unzip with-args
  Swt bnd arg with-bnd with-arg pred arms

-- Match
match'_:=_with'_in'_ : Maybe String -> Term -> List' (Pair (Maybe String) Term) -> List' (Pair (Maybe String) Term) -> Term
match' bnd := arg with' with-args in' arms = do
  let with-bnd , with-arg = unzip with-args
  let arms = map (λ x -> (MkMatchRule (fst x) [] (snd x))) arms
  Mat bnd arg with-bnd with-arg arms

-- Fold
fold'_:=_with'_in'_ : Maybe String -> Term -> List' (Pair (Maybe String) Term) -> List' (Pair (Maybe String) Term) -> Term
fold' bnd := arg with' with-args in' arms = do
  let with-bnd , with-arg = unzip with-args
  let arms = map (λ x -> (MkMatchRule (fst x) [] (snd x))) arms
  Fold bnd arg with-bnd with-arg arms

-- Bend
bend'_when'_step'_else'_ : List' (Pair (Maybe String) Term) -> Term -> Term -> Term -> Term
bend' args when' cond step' step else' base = do
  let bnd , arg = unzip args
  Bend bnd arg cond step base

-- Open (new implementation)
open'_:=_in'_ : String -> String -> Term -> Term
open'_:=_in'_ typ var bod = Open typ var bod

-- Pattern syntax
p' : String -> Pattern
p' x = P.Var (Some x)

p'* : Pattern
p'* = P.Var None

p'$ : String -> Pattern
p'$ = P.Chn

p'tup : List' Pattern -> Pattern
p'tup = P.Fan Fan.Tup

p'dup : List' Pattern -> Pattern
p'dup = P.Fan Fan.Dup

p'#u : Nat -> Pattern
p'#u = P.Num

p'ctr : String -> List' Pattern -> Pattern
p'ctr = P.Ctr

n' : String -> Maybe String
n' x = Some x

n'* : Maybe String
n'* = None

t' : String -> T.Type
t' x = T.Var x

t'none : T.Type
t'none = T.None

t'any : T.Type
t'any = T.Any

_->'_ : T.Type -> T.Type -> T.Type
_->'_ = T.Arr

infixr 5 _->'_

t'ctr : String -> List' T.Type -> T.Type
t'ctr = T.Ctr

t'tup : List' T.Type -> T.Type
t'tup = T.Tup

t'u24 : T.Type
t'u24 = T.U24

t'i24 : T.Type
t'i24 = T.I24

t'f24 : T.Type
t'f24 = T.F24

t'- : T.Type
t'- = T.Hole

rule_:=_ : List' Pattern -> Term -> Rule
rule_:=_ = MkRule

def_:'_checked_:=_ : String -> T.Type -> Bool -> List' Rule -> FnDef
def name :' typ checked chk := rules = MkFnDef name typ chk rules (MkSource None None Generated)
