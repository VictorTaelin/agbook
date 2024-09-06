module Data.HTTP.Request where

open import Data.String.Type
open import Data.List.Type
open import Data.List.append
open import Data.Pair.Type

data Method : Set where
  GET     : Method
  POST    : Method
  PUT     : Method
  DELETE  : Method
  OPTIONS : Method
  HEAD    : Method

methodToString : Method → String
methodToString GET     = "GET"
methodToString POST    = "POST"
methodToString PUT     = "PUT"
methodToString DELETE  = "DELETE"
methodToString OPTIONS = "OPTIONS"
methodToString HEAD    = "HEAD"

record Request : Set where
  constructor MkRequest
  field
    method  : Method
    path    : String
    headers : List (Pair String String)
    body    : String

makeRequest : Method → String → List (Pair String String) → String → Request
makeRequest = MkRequest

-- Example usage
exampleRequest : Request
exampleRequest = makeRequest GET "/api/users" 
                   (("Content-Type" , "application/json") :: []) 
                   ""
