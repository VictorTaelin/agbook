module Base.JSON.Test.parse-number where

open import Base.JSON.Type
open import Base.JSON.parse-number
open import Base.Parser.Type
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Type
open import Base.String.Type
open import Base.Nat.Type
open import Base.Equal.Type
open import Base.Float.Type
open import Base.Function.case
open import Base.Bool.Type
open import Base.Unit.Type
open import Base.Empty.Type

-- Helper function to run the parser and extract the result
run-parser : Parser JSON → String → Result JSON Error
run-parser parser input =
  case parser (new_parser_state input) of λ where
    (Done (MkReply _ value)) → Done value
    (Fail e) → Fail e

-- Test cases
test-parse-number-1 : run-parser parse-number "42" === Done (JNumber 42.0)
test-parse-number-1 = refl

test-parse-number-2 : run-parser parse-number "-3.14" === Done (JNumber -3.14)
test-parse-number-2 = refl

test-parse-number-3 : run-parser parse-number "0" === Done (JNumber 0.0)
test-parse-number-3 = refl

test-parse-number-4 : run-parser parse-number "-0.5" === Done (JNumber -0.5)
test-parse-number-4 = refl

test-parse-number-5 : run-parser parse-number "  123.456  " === Done (JNumber 123.456)
test-parse-number-5 = refl

test-parse-number-6 : run-parser parse-number "1e3" === Done (JNumber 1000.0)
test-parse-number-6 = refl

test-parse-number-7 : run-parser parse-number "1e-3" === Done (JNumber 1.0e-3)
test-parse-number-7 = refl

test-parse-number-8 : run-parser parse-number "1e+3" === Done (JNumber 1000.0)
test-parse-number-8 = refl

