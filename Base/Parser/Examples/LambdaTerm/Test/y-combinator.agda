module Base.Parser.Examples.LambdaTerm.Test.y-combinator where

open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Result.Type
open import Base.Parser.Type
open import Base.Parser.Examples.LambdaTerm.Type
open import Base.Parser.Examples.LambdaTerm.new
open import Base.Parser.Examples.LambdaTerm.parse
open import Base.Equal.Type

_ : let parsed = parse (new "λf (λx (f (x x)) λx (f (x x)))")
    in  parsed === 
            (Done (MkReply (MkState "" 30)
            (Lam "f"
              (App
                (Lam "x" (App (Var "f") (App (Var "x") (Var "x"))))
                (Lam "x" (App (Var "f") (App (Var "x") (Var "x"))))))))
_ = refl
