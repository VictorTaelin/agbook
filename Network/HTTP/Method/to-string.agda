module Network.HTTP.Method.to-string where

open import Base.String.Type
open import Network.HTTP.Method.Type

to-string : Method -> String
to-string GET     = "GET"
to-string POST    = "POST"
to-string PUT     = "PUT"
to-string DELETE  = "DELETE"
to-string OPTIONS = "OPTIONS"
to-string HEAD    = "HEAD"

