module Base.Network.HTTP.Method.to-string where

open import Base.String.String
open import Base.Network.HTTP.Method.Method

to-string : Method → String
to-string GET     = "GET"
to-string POST    = "POST"
to-string PUT     = "PUT"
to-string DELETE  = "DELETE"
to-string OPTIONS = "OPTIONS"
to-string HEAD    = "HEAD"

