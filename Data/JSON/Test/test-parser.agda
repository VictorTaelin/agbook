module Data.JSON.Test.test-parser where

open import Data.String.Type
open import Data.String.show
open import Data.String.append
open import Data.Nat.show renaming (show to showN)
open import Data.JSON.Type
open import Data.JSON.parse
open import Data.JSON.show renaming (show to show-json)
open import Data.Parser.State
open import Data.Parser.Error
open import Data.Parser.Reply
open import Data.Result.Type
open import Data.IO.print
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.seq
open import Data.Unit.Type
open import Data.Function.case
open import Data.Bool.Type
open import Data.Bool.if

-- Helper function to run a single test case
run-test : String → String → IO Unit
run-test description json-string = do
  print ("Test: " ++ description)
  print ("Input: " ++ show json-string)
  case parse-json-string json-string of λ where
    (Done reply) → do
      print "Parsing successful!"
      print ("Parsed JSON: " ++ show-json (Reply.value reply))
    (Fail error) → do
      print "Parsing failed!"
      print ("Error: " ++ Error.error error ++ " at index " ++ showN (Error.index error))
  print ""

-- Main test function
test-json-parser : IO Unit
test-json-parser = do
  -- Test 1: Simple object
  run-test "Simple object" "{ \"key\": \"value\" }"

  -- Test 2: Nested object
  run-test "Nested object" "{ \"outer\": { \"inner\": 42 } }"

  print "All tests completed."

-- Main function to run the tests
main : IO Unit
main = test-json-parser
