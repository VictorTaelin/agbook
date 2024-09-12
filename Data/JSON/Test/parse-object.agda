module Data.JSON.Test.parse-object where

open import Data.JSON.Type
open import Data.JSON.parse
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Error
open import Data.Result.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Bool.Type
open import Data.List.Type
open import Data.Pair.Type

test-empty-object : parse-json-string "{}" === Done (MkReply (MkState "" 2) (JObject []))
test-empty-object = refl

test-single-string-property : parse-json-string "{ \"key\": \"value\" }" === Done (MkReply (MkState "" 18) (JObject (("key" , JString "value") :: [])))
test-single-string-property = refl

test-multiple-properties : parse-json-string "{ \"name\": \"John\", \"age\": 30, \"is_student\": false }" ===
  Done (MkReply (MkState "" 50) (JObject (("name" , JString "John") :: ("age" , JNumber 30.0) :: ("is_student" , JBool False) :: [])))
test-multiple-properties = refl

test-nested-object : parse-json-string "{ \"person\": { \"name\": \"Alice\", \"age\": 25 } }" ===
  Done (MkReply (MkState "" 44) (JObject (("person" , JObject (("name" , JString "Alice") :: ("age" , JNumber 25.0) :: [])) :: [])))
test-nested-object = refl

test-invalid-object : parse-json-string "{ \"key\": \"value\"" ===
  Fail (MkError 16 "Expected }")
test-invalid-object = refl

test-object-with-whitespace : parse-json-string "  {   \"key\"  :  \"value\"   }  " ===
  Done (MkReply (MkState "  " 27) (JObject (("key" , JString "value") :: [])))
test-object-with-whitespace = refl



