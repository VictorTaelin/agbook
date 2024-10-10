module Bend.Parser.parse-name- where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.eq
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.List.List
open import Base.List.eq
open import Base.String.String
open import Base.String.eq
open import Base.Result.Result
open import Base.Equal.Equal
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Maybe.Maybe
open import Bend.Parser.parse-name

parse : String → String → Result (Reply String) Error
parse kind input = parse-name kind (new-parser-state input)

test-parse-name : String → String → String
test-parse-name kind input =
  case parse kind input of λ where
    (Done (MkReply _ parsed-name)) → parsed-name
    (Fail (MkError _ msg)) → msg

-- Valid name
_ : test-parse-name "Variable" "validName" ≡ "validName"
_ = refl

-- Valid name with numbers
_ : test-parse-name "Function" "func123" ≡ "func123"
_ = refl

-- Empty name (should fail)
_ : test-parse-name "Datatype" "" ≡ "Expected Datatype name"
_ = refl

-- Name containing "__" (should fail)
_ : test-parse-name "Variable" "invalid__name" ≡ "Names are not allowed to contain \"__\"."
_ = refl

-- Name starting with "//" (should fail)
_ : test-parse-name "Function" "//invalidStart" ≡ "Names are not allowed to start with \"//\"."
_ = refl

-- Name starting with numbers (should fail)
_ : test-parse-name "Function" "123abc" ≡ "Names are not allowed to start with a number."
_ = refl

-- Valid name with special characters
_ : test-parse-name "Variable" "valid_-./name" ≡ "valid_-./name"
_ = refl

-- Name with space (should only parse up to the space)
_ : test-parse-name "Datatype" "Valid Name" ≡ "Valid"
_ = refl

-- Name with trailing non-name chars (should parse correctly)
_ : test-parse-name "Function" "validName' " ≡ "validName"
_ = refl

-- Name with leading space (should fail)
_ : test-parse-name "Variable" " invalidLeadingSpace" ≡ "Expected Variable name"
_ = refl

