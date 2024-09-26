module Base.JSON.Test.parse-array where

open import Base.JSON.JSON
open import Base.JSON.parse-array
open import Base.JSON.parse
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Result
open import Base.String.String
open import Base.Nat.Nat
open import Base.Equal.Equal
open import Base.Bool.Bool
open import Base.List.List
open import Base.F64.F64

test-parse-empty-array : parse-array parse-JSON (MkState "[]" 0) ≡ Done (MkReply (MkState "" 2) (JArray []))
test-parse-empty-array = refl

test-parse-array-with-whitespace : parse-array parse-JSON (MkState " [ ] " 0) ≡ Done (MkReply (MkState " " 4) (JArray []))
test-parse-array-with-whitespace = refl

test-parse-array-single-element : parse-array parse-JSON (MkState "[null]" 0) ≡ Done (MkReply (MkState "" 6) (JArray (JNull :: [])))
test-parse-array-single-element = refl

test-parse-array-multiple-elements : parse-array parse-JSON (MkState "[true,false,null]" 0) ≡ Done (MkReply (MkState "" 17) (JArray (JBool True :: JBool False :: JNull :: [])))
test-parse-array-multiple-elements = refl

test-parse-array-mixed-types : parse-array parse-JSON (MkState "[1,\"hello\"]" 0) ≡ Done (MkReply (MkState "" 11) (JArray (JNumber 1.0 :: JString "hello" :: [])))
test-parse-array-mixed-types = refl

test-parse-array-with-whitespace-between-elements : parse-array parse-JSON (MkState "[ 1 , 2 , 3 ]" 0) ≡ Done (MkReply (MkState "" 13) (JArray (JNumber 1.0 :: JNumber 2.0 :: JNumber 3.0 :: [])))
test-parse-array-with-whitespace-between-elements = refl

test-parse-empty-nested-array : parse-array parse-JSON (MkState "[[]]" 0) ≡ Done (MkReply (MkState "" 4) (JArray (JArray [] :: [])))
test-parse-empty-nested-array = refl

