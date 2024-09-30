module Bend.Fun.Book.Test.show where

open import Bend.Fun.Book.Book
open import Bend.Fun.Book.new renaming (new to book-new)
open import Bend.Fun.Book.show
open import Bend.Fun.Term.Term
open import Bend.Fun.Term.show
open import Bend.Fun.FnDef.show
open import Bend.Fun.Type.Type using () renaming (Type to Ty)
open import Bend.Source.Source
open import Bend.Source.SourceKind
open import Base.BitMap.BitMap
open import Base.BitMap.from-list
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.eq
open import Base.String.hash
open import Base.List.List
open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Trait.Show
import Bend.Fun.Rule.Rule as Rule'
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module Rule = Rule' Term
  open module FnDef = FnDef' Term

  dummy-source : Source
  dummy-source = MkSource None None SourceKind.Generated

  dummy-rule : Rule
  dummy-rule = MkRule [] (Var "dummy")

  dummy-fn-def : String → FnDef
  dummy-fn-def name = MkFnDef name (Ty.Var "Type") True (dummy-rule :: []) dummy-source

  dummy-book : Book
  dummy-book = MkBook (from-list
    ((hash "func1" , dummy-fn-def "func1") ::
     (hash "func2" , dummy-fn-def "func2") :: []))
     (from-list []) (from-list [])

test-empty-book : show book-new ≡ ""
test-empty-book = refl

test-single-function-book :
  show (MkBook (from-list ((hash "func" , dummy-fn-def "func") :: [])) (from-list []) (from-list []))
  ≡
  "func : Type\n(func) = dummy"
test-single-function-book = refl

test-multiple-functions-book :
  show dummy-book
  ≡
  "func1 : Type\n(func1) = dummy\n\nfunc2 : Type\n(func2) = dummy"
test-multiple-functions-book = refl
