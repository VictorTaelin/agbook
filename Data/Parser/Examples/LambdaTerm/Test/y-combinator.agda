module Data.Parser.Examples.LambdaTerm.Test.y-combinator where

open import Data.Parser.Error
open import Data.Parser.Reply
open import Data.Parser.State
open import Data.Result.Type
open import Data.Parser.Type
open import Data.Parser.Examples.LambdaTerm.Type
open import Data.Parser.Examples.LambdaTerm.new
open import Data.Parser.Examples.LambdaTerm.parse
open import Data.Equal.Type

_ : let parsed = parse (new "λf (λx (f (x x)) λx (f (x x)))")
    in  parsed === 
            (Done (MkReply (MkState "" 30)
            (Lam "f"
              (App
                (Lam "x" (App (Var "f") (App (Var "x") (Var "x"))))
                (Lam "x" (App (Var "f") (App (Var "x") (Var "x"))))))))
_ = refl
