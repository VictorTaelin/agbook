module Data.JSON.Main where

open import Data.String.Type
open import Data.String.show
open import Data.String.eq
open import Data.String.append
open import Data.JSON.Type
open import Data.JSON.parse
open import Data.Parser.State
open import Data.Parser.Error
open import Data.Parser.Reply
open import Data.Result.Type
open import Data.Result.bind
open import Data.IO.print
open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.seq
open import Data.Unit.Type
open import Data.Maybe.Type
open import Data.Function.case
open import Data.Bool.Type
open import Data.Bool.if
open import Data.List.Type
open import Data.List.map
open import Data.List.fold
open import Data.Pair.Type
open import Data.Float.Type
open import Data.Float.Operations

parse-json-string : String → Result (Reply JSON) Error
parse-json-string input = 
  parseJSON (record { input = input ; index = 0 })

show-json : JSON → String
show-json JNull = "null"
show-json (JBool True) = "true"
show-json (JBool False) = "false"
show-json (JNumber n) = primShowFloat n
show-json (JString s) = show s
show-json (JArray arr) = 
  "[" ++ (fold (λ elem acc → 
    (if acc == "" then "" else acc ++ ", ") ++ show-json elem) 
  "" arr) ++ "]"
show-json (JObject obj) = 
  "{" ++ (fold (λ pair acc → 
    (if acc == "" then "" else acc ++ ", ") ++ 
    show (Pair.fst pair) ++ ": " ++ show-json (Pair.snd pair))
  "" obj) ++ "}"

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

