module Data.JSON.Main where

open import Data.String.Type
open import Data.String.show
open import Data.String.append
open import Data.JSON.Type
open import Data.JSON.parse
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
open import Data.JSON.show renaming (show to show-json)

main : IO Unit
main = do
  let json-string = "{ \"key\": { \"another\": [\"hey\", \"12.213\", { \"heyu\": \"j\" }] } }"
  print ("Parsing JSON string: " ++ show json-string) 
  case parse-json-string json-string of λ where
    (Done reply) → do
      print "Parsing successful!"
      print ("Parsed JSON: " ++ show-json (Reply.value reply))
    (Fail error) → do
      print "Parsing failed!"
