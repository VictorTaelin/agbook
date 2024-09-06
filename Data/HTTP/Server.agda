module Data.HTTP.Server where

open import Data.HTTP.Request
open import Data.HTTP.Response
open import Data.String.Type
open import Data.String.eq
open import Data.List.Type
open import Data.Pair.Type
open import Data.Maybe.Type
open import Data.IO.Type
open import Data.IO.pure
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.and
open import Data.Function.case
open import Data.Maybe.bind

Handler : Set
Handler = Request → IO Response

record Route : Set where
  constructor MkRoute
  field
    path     : String
    method   : Method
    handler  : Handler

record Server : Set where
  constructor MkServer
  field 
    routes : List Route

addRoute : Server → Route → Server
addRoute (MkServer routes) newRoute = MkServer (newRoute :: routes)

findRoute : Server → Request → Maybe Handler
findRoute (MkServer routes) req = findHelper routes
  where
    findHelper : List Route → Maybe Handler
    findHelper [] = None
    findHelper (route :: rs) = 
      if (((Route.path route) == (Request.path req)) && ((methodToString (Route.method route)) == (methodToString (Request.method req))))
      then Some (Route.handler route)
      else findHelper rs

handleRequest : Server → Request → IO Response
handleRequest server req = 
  case findRoute server req of λ where
    (Some handler) → handler req 
    None → pure (makeResponse NotFound [] "404 Not Found")

exampleHandler : Handler
exampleHandler _ = pure (makeResponse OK [] "Hello, World!")

exampleServer : Server
exampleServer =
  addRoute
    (addRoute (MkServer [])
      (MkRoute "/hello" GET exampleHandler))
    (MkRoute "/api" POST exampleHandler)

