module Bend.Parser.parse-oper where

open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.fail
open import Base.Parser.alternative
open import Base.String.String
open import Bend.Parser.consume
open import Bend.Fun.Op.Op

-- Parses a Bend numeric operator.
-- = The parsed operator.
parse-oper : Parser Op
parse-oper =
  ((consume "+")  >> (pure Add)) <|>
    ((consume "-")  >> (pure Sub)) <|>
    ((consume "**") >> (pure Pow)) <|>
    ((consume "*")  >> (pure Mul)) <|>
    ((consume "/")  >> (pure Div)) <|>
    ((consume "%")  >> (pure Rem)) <|>
    ((consume "<<") >> (pure Shl)) <|>
    ((consume ">>") >> (pure Shr)) <|>
    ((consume "<=") >> (pure Lte)) <|>
    ((consume ">=") >> (pure Gte)) <|>
    ((consume "<")  >> (pure Ltn)) <|>
    ((consume ">")  >> (pure Gtn)) <|>
    ((consume "==") >> (pure Eql)) <|>
    ((consume "!=") >> (pure Neq)) <|>
    ((consume "&")  >> (pure And)) <|>
    ((consume "|")  >> (pure Or))  <|>
    ((consume "^")  >> (pure Xor)) <|>
    fail "Expected operator"

