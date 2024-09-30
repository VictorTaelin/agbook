module Bend.Fun.Term.Test.show where

open import Bend.Fun.Type.Type using () renaming (Type to Ty)
open import Bend.Fun.Term.Term
open import Bend.Fun.Term.show
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.FanKind.FanKind
open import Bend.Fun.Op.Op
open import Bend.Fun.Num.Num renaming (Num to Num')
open import Bend.Source.Source
open import Bend.Source.SourceKind
open import Base.String.String
open import Base.String.eq
open import Base.String.append
open import Base.List.List renaming (List to List')
open import Base.Maybe.Maybe
open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Equal.Equal
open import Base.Trait.Show
open import Base.Pair.Pair

import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.Rule.Rule as Rule'

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term
  open module Rule = Rule' Term

test-var : show (Var "x") ≡ "x"
test-var = refl

test-lam : show (Lam (Var (Some "x")) (Var "x")) ≡ "λx x"
test-lam = refl

test-let : show (Let (Var (Some "x")) (Num (U24 5)) (Var "x")) ≡ "let x = 5; x"
test-let = refl

test-app : show (App (Var "f") (Var "x")) ≡ "(f x)"
test-app = refl

test-app-many : show (App (App (Var "f") (Var "x")) (Var "y")) ≡ "(f x y)"
test-app-many = refl

test-fan-tup : show (Fan FanKind.Tup (Var "x" :: Var "y" :: [])) ≡ "(x, y)"
test-fan-tup = refl

test-fan-dup : show (Fan FanKind.Dup (Var "x" :: Var "y" :: [])) ≡ "{x y}"
test-fan-dup = refl

test-num : show (Num (U24 42)) ≡ "42"
test-num = refl

test-str : show (Str "hello") ≡ "\"hello\""
test-str = refl

test-list : show (List (Var "x" :: Var "y" :: [])) ≡ "[x, y]"
test-list = refl

test-oper : show (Oper Add (Var "x") (Var "y")) ≡ "(x + y)"
test-oper = refl

test-mat : show (Mat (Some "x") (Var "expr") [] []
             ((MkMatchRule (Some "case1") [] (Var "result1")) ::
              (MkMatchRule (Some "case2") [] (Var "result2")) :: []))
           ≡ "match x = expr { case1: result1; case2: result2 }"
test-mat = refl

test-swt : show (Swt (Some "x") (Var "expr") [] [] None (Var "case1" :: Var "case2" :: []))
           ≡ "switch x = expr { 0: case1; _ *: case2 }"
test-swt = refl

test-fold : show (Fold (Some "acc") (Var "list") [] []
              ((MkMatchRule (Some "case1") [] (Var "result1")) ::
               (MkMatchRule (Some "case2") [] (Var "result2")) :: []))
            ≡ "fold acc = list { case1: result1; case2: result2 }"
test-fold = refl

test-bend : show (Bend (Some "i" :: []) (Num (U24 0) :: []) (Var "cond") (Var "step") (Var "base"))
            ≡ "bend i = 0 { when cond: step; else: base }"
test-bend = refl

test-open : show (Open "Module" "m" (Var "expr")) ≡ "open Module m; expr"
test-open = refl

test-def :
  let rule = MkRule [] (Var "dummy") in
  let def = (MkFnDef "func" (Ty.Var "Type") True (rule :: []) (MkSource None None SourceKind.Generated)) in
  show (Def def (Var "next"))
  ≡
  "def func : Type\n" ++ "(func) = dummy\n" ++ "next"
test-def = refl

test-era : show Era ≡ "*"
test-era = refl

test-tuple-elimination : show (Let (Fan FanKind.Tup (Var None :: Var (Some "b") :: [])) (Var "val") (Var "nxt"))
                         ≡ "let (*, b) = val; nxt"
test-tuple-elimination = refl

test-lam-dup : show (Lam (Fan FanKind.Dup (Var (Some "a") :: Var (Some "b") :: [])) (Var "val"))
               ≡ "λ{a b} val"
test-lam-dup = refl
