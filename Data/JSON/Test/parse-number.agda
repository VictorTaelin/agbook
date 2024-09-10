module Data.JSON.Test.parse-number where

open import Data.JSON.Type
open import Data.JSON.parse-number
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Error
open import Data.Result.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Float.Type
open import Data.Function.case
open import Data.Bool.Type
open import Data.Unit.Type
open import Data.Empty.Type

-- Helper function to run the parser and extract the result
run-parser : Parser JSON → String → Result JSON Error
run-parser parser input =
  case parser (new_parser_state input) of λ where
    (Done (MkReply _ value)) → Done value
    (Fail e) → Fail e

-- Test cases
test-parse-number-1 : run-parser parse-number "42" == Done (JNumber 42.0)
test-parse-number-1 = refl

test-parse-number-2 : run-parser parse-number "-3.14" == Done (JNumber -3.14)
test-parse-number-2 = refl

test-parse-number-3 : run-parser parse-number "0" == Done (JNumber 0.0)
test-parse-number-3 = refl

test-parse-number-4 : run-parser parse-number "-0.5" == Done (JNumber -0.5)
test-parse-number-4 = refl

test-parse-number-5 : run-parser parse-number "  123.456  " == Done (JNumber 123.456)
test-parse-number-5 = refl

test-parse-number-6 : run-parser parse-number "1e3" == Done (JNumber 1000.0)
test-parse-number-6 = refl

test-parse-number-7 : run-parser parse-number "1e-3" == Done (JNumber 1.0e-3)
test-parse-number-7 = refl

test-parse-number-8 : run-parser parse-number "1e+3" == Done (JNumber 1000.0)
test-parse-number-8 = refl

