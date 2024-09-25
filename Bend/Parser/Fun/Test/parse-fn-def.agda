module Bend.Parser.Fun.Test.parse-fn-def where

open import Base.Parser.Type
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Error
open import Bend.Parser.Fun.parse-fn-def
open import Bend.Fun.Rule.Type
open import Bend.Fun.Term.Type
open import Bend.Fun.Op.Type
open import Bend.Fun.Pattern.Type
open import Bend.Fun.Type.Type
open import Bend.Fun.dsl
open import Bend.Source.Type
open import Base.Function.case
open import Base.Equal.Type
open import Base.String.Type
open import Base.Maybe.Type
open import Base.Result.Type
open import Base.List.Type
open import Base.Pair.Type
open import Base.Nat.Type
open import Base.Bool.Type
import Bend.Fun.FnDef.Type as FnDef'

private
  open module FnDef = FnDef' Term

parse : String -> Result (Reply FnDef) Error
parse input = parse-fn-def (MkState input 0)

ok : String -> Nat -> FnDef -> Result (Reply FnDef) Error
ok input index expected = Done (MkReply (MkState input index) expected)

-- Simple function definition
_ : parse "f x = x" ≡
    ok "" 7 (def "f" :' t'any checked False := 
              ((rule (p'"x" :: []) := v'"x") :: []))
_ = refl

-- Function with explicit type signature
_ : parse "f (x: u24) : u24 = (+ x 1)" ≡
    ok "" 26 (def "f" :' (t'u24 ->' t'u24) checked True := 
                ((rule (p'"x" :: []) := (+ (v'"x") (#u 1))) :: []))
_ = refl

-- Function with multiple arguments
_ : parse "add x y = (+ x y)" ≡
    ok "" 17 (def "add" :' t'any checked False := 
                ((rule (p'"x" :: p'"y" :: []) := (+ (v'"x") (v'"y"))) :: []))
_ = refl

-- Function with multiple rules
_ : parse "fib 0 = 0\nfib 1 = 1\nfib n = (+ (fib (- n 1)) (fib (- n 2)))" ≡
    ok "" 59 (def "fib" :' t'any checked False :=
      ((rule ((p'#u 0) :: []) := #u 0) ::
      (rule ((p'#u 1) :: []) := #u 1) ::
      (rule ((p' "n") :: []) := (+ (v'"fib" $ (- (v'"n") (#u 1))) (v'"fib" $ (- (v'"n") (#u 2))))) ::
      []))
_ = refl

-- Unchecked function
_ : parse "unchecked f x = x" ≡
    ok "" 17 (def "f" :' t'any checked False := 
              ((rule (p'"x" :: []) := v'"x") :: []))
_ = refl

-- Function with complex pattern matching
_ : parse "head (Cons x xs) = x\nhead Nil = (error \"Empty list\")" ≡
    ok "" 52 (def "head" :' t'any checked False :=
              ((rule ((p'ctr "Cons" (p'"x" :: p'"xs" :: [])) :: []) := v'"x") ::
               (rule (p' "Nil" :: []) := (v'"error" $ (str "Empty list"))) :: []))
_ = refl

-- Invalid function definition (missing '=')
-- TODO: Improve error message
_ : parse "f x x" ≡ Fail (MkError 5 "Expected pattern")
_ = refl

-- Invalid function definition (empty body)
_ : parse "f x =" ≡ Fail (MkError 5 "Expected term")
_ = refl
