module Data.HTTP.Response where

open import Data.String.Type
open import Data.List.Type
open import Data.List.append
open import Data.Pair.Type
open import Data.Nat.Type

data StatusCode : Set where
  OK                  : StatusCode
  Created             : StatusCode
  NoContent           : StatusCode
  BadRequest          : StatusCode
  Unauthorized        : StatusCode
  Forbidden           : StatusCode
  NotFound            : StatusCode
  InternalServerError : StatusCode

statusCodeToNat : StatusCode → Nat
statusCodeToNat OK                  = 200
statusCodeToNat Created             = 201
statusCodeToNat NoContent           = 204
statusCodeToNat BadRequest          = 400
statusCodeToNat Unauthorized        = 401
statusCodeToNat Forbidden           = 403
statusCodeToNat NotFound            = 404
statusCodeToNat InternalServerError = 500

record Response : Set where
  constructor MkResponse
  field
    statusCode : StatusCode
    headers    : List (Pair String String)
    body       : String

makeResponse : StatusCode → List (Pair String String) → String → Response
makeResponse = MkResponse

-- Example usage
exampleResponse : Response
exampleResponse = makeResponse OK 
                    (("Content-Type" , "application/json") :: []) 
                    "{\"message\": \"Hello, World!\"}"


