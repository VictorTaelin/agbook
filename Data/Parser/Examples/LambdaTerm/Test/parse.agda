module Data.Parser.Examples.LambdaTerm.Test.parse where

open import Data.Bool.Type
open import Data.Bool.show
open import Data.String.Type
open import Data.String.show
open import Data.String.from-list
open import Data.List.Type
open import Data.Maybe.Type
open import Data.Pair.Type
open import Data.Parser.Type
open import Data.Parser.run-parser
open import Data.Parser.Examples.LambdaTerm.Type
open import Data.Parser.Examples.LambdaTerm.parse
open import Data.Trait.Eq
open import Data.Trait.Show

-- Helper function to run the parser and compare the result
parse-and-compare : String → Term → Bool
parse-and-compare input expected =
  case run-parser parse input of λ where
    (Some (Pair result _)) → result == expected
    _ → False

-- Test cases
test-var : Bool
test-var = parse-and-compare "x" (Var "x")

test-lam : Bool
test-lam = parse-and-compare "λx x" (Lam "x" (Var "x"))

test-app : Bool
test-app = parse-and-compare "(x y)" (App (Var "x") (Var "y"))

test-complex : Bool
test-complex = parse-and-compare "λf (λx (f x))" 
  (Lam "f" (Lam "x" (App (Var "f") (Var "x"))))

test-with-whitespace : Bool
test-with-whitespace = parse-and-compare "  λx  ( x   y )  " 
  (Lam "x" (App (Var "x") (Var "y")))

-- Run all tests
all-tests : List (Pair String Bool)
all-tests = 
  ("test-var" , test-var) ::
  ("test-lam" , test-lam) ::
  ("test-app" , test-app) ::
  ("test-complex" , test-complex) ::
  ("test-with-whitespace" , test-with-whitespace) ::
  []

-- Helper function to show test results
show-test-result : Pair String Bool → String
show-test-result (Pair name result) = 
  name ++ ": " ++ (if result then "PASS" else "FAIL")

-- Show all test results
show-all-tests : String
show-all-tests = from-list (map show-test-result all-tests)