module Base.JSON.Test.parse-number where

open import Base.JSON.JSON
open import Base.JSON.parse-number
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Result
open import Base.String.String
open import Base.Nat.Nat
open import Base.Equal.Equal
open import Base.F64.F64
open import Base.Function.case
open import Base.Bool.Bool
open import Base.Unit.Unit
open import Base.Empty.Empty

-- Helper function to run the parser and extract the result
run-parser : Parser JSON -> String -> Result JSON Error
run-parser parser input =
  case parser (new-parser-state input) of λ where
    (Done (MkReply _ value)) -> Done value
    (Fail e) -> Fail e

-- Test cases
test-parse-number-1 : run-parser parse-number "42" ≡ Done (JNumber 42.0)
test-parse-number-1 = refl

test-parse-number-2 : run-parser parse-number "-3.14" ≡ Done (JNumber -3.14)
test-parse-number-2 = refl

test-parse-number-3 : run-parser parse-number "0" ≡ Done (JNumber 0.0)
test-parse-number-3 = refl

test-parse-number-4 : run-parser parse-number "-0.5" ≡ Done (JNumber -0.5)
test-parse-number-4 = refl

test-parse-number-5 : run-parser parse-number "  123.456  " ≡ Done (JNumber 123.456)
test-parse-number-5 = refl

test-parse-number-6 : run-parser parse-number "1e3" ≡ Done (JNumber 1000.0)
test-parse-number-6 = refl

test-parse-number-7 : run-parser parse-number "1e-3" ≡ Done (JNumber 1.0e-3)
test-parse-number-7 = refl

test-parse-number-8 : run-parser parse-number "1e+3" ≡ Done (JNumber 1000.0)
test-parse-number-8 = refl
