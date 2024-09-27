module Base.JSON.show where

import Base.F64.show as F64
import Base.String.show as String
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.F64.F64
open import Base.JSON.JSON
open import Base.List.List
open import Base.List.foldr
open import Base.Pair.Pair
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.String.String
open import Base.String.append
open import Base.String.eq

-- FIXME: use String.join instead
{-# TERMINATING #-} -- FIXME!
show : JSON -> String
show JNull         = "null"
show (JBool True)  = "true"
show (JBool False) = "false"
show (JNumber n)   = F64.show n
show (JString s)   = String.show s
show (JArray arr)  = "[" ++ (foldr (λ elem acc -> (if eq acc "" then "" else acc ++ ", ") ++ show elem) "" arr) ++ "]"
show (JObject obj) = "{" ++ (foldr (λ pair acc -> (if eq acc "" then "" else acc ++ ", ") ++ String.show (get-fst pair) ++ ": " ++ show (get-snd pair)) "" obj) ++ "}"
