-- FIXME: update

module HVM.Parser.parse-net- where

open import Base.Equal.Equal
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.String.String
open import HVM.Net.Net
open import HVM.Parser.parse-net
open import HVM.Redex.Redex
open import HVM.Term.Term
open import Base.Result.Result

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

