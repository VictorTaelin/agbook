module HVM2.Parser.Test.parse-net where

open import Base.Equal.Type
open import Base.List.Type
open import Base.Maybe.Type
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.String.Type
open import HVM2.Net.Type
open import HVM2.Parser.parse-net
open import HVM2.Redex.Type
open import HVM2.Term.Type
open import Base.Result.Type

_ : parse-net (new-parser-state "r & ({x0 x1} (x0 x1)) ~ {(x2 x3) {x2 x3}}") ≡
  Done (MkReply
    (MkState "" 41)
    (MkNet
      -- rbag
      (
        (MkRedex
          (Con (Dup (Var "x0") (Var "x1")) (Con (Var "x0") (Var "x1")))
          (Dup (Con (Var "x2") (Var "x3")) (Dup (Var "x2") (Var "x3")))
        ) :: []
      )
      -- root
      (Var "r")
    )
  )
_ = refl

-- test-parse-net-empty : run parse-net "" ≡ None
-- test-parse-net-empty = refl

-- test-parse-net-invalid : run parse-net "invalid input" ≡ None
-- test-parse-net-invalid = refl
