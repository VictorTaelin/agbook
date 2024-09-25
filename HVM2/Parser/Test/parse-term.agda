module HVM2.Parser.Test.parse-term where

open import Base.Equal.Type
open import Base.List.Type
open import Base.Maybe.Type
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.String.Type
open import HVM2.Net.Type
open import HVM2.Parser.parse-term
open import HVM2.Redex.Type
open import HVM2.Term.Type
open import Base.Result.Type

_ : parse-term (new-parser-state "*") ≡
  Done (MkReply
    (MkState "" 1)
    (Era)
  )
_ = refl

_ : parse-term (new-parser-state "x0") ≡
  Done (MkReply
    (MkState "" 2)
    (Var "x0")
  )
_ = refl

_ : parse-term (new-parser-state "(x0 x1)") ≡
  Done (MkReply
    (MkState "" 7)
    (Con (Var "x0") (Var "x1"))
  )
_ = refl
