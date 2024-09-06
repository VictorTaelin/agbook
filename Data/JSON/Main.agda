module Data.JSON.Main where

open import Data.String.Type
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

parse-json-string : String → Result (Reply JSON) Error
parse-json-string input = 
  parseJSON (record { input = input ; index = 0 })

-- Usage:

Main : IO Unit
Main = do
  print ("hello")

--Main : Result (Reply JSON) Error
--Main = parse-json-string "{ \"key\": \"value\", \"array\": [1, 2, 3] }"
