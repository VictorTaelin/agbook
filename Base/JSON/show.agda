module Base.JSON.show where

import Base.String.show as String
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Float.Type
open import Base.JSON.Type
open import Base.List.Type
open import Base.List.foldr
open import Base.Pair.Type
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.String.Type
open import Base.String.append
open import Base.String.eq

-- FIXME: use String.join instead
show : JSON → String
show JNull         = "null"
show (JBool True)  = "true"
show (JBool False) = "false"
show (JNumber n)   = primShowFloat n
show (JString s)   = String.show s
show (JArray arr)  = "[" ++ (foldr (λ elem acc → (if eq acc "" then "" else acc ++ ", ") ++ show elem) "" arr) ++ "]"
show (JObject obj) = "{" ++ (foldr (λ pair acc → (if eq acc "" then "" else acc ++ ", ") ++ String.show (fst pair) ++ ": " ++ show (snd pair)) "" obj) ++ "}"
