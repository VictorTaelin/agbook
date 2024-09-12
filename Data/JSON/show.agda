module Data.JSON.show where

open import Data.JSON.Type
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Float.Type
open import Data.String.Type
open import Data.String.show renaming (show to show-str)
open import Data.String.append
open import Data.String.eq
open import Data.List.Type
open import Data.List.foldr
open import Data.Pair.Type
open import Data.Pair.fst
open import Data.Pair.snd

-- Converts a JSON value to its string representation.
-- - json: The JSON value to convert.
-- = A string representation of the JSON value.
show : JSON → String
show JNull = "null"
show (JBool True) = "true"
show (JBool False) = "false"
show (JNumber n) = primShowFloat n
show (JString s) = show-str s
show (JArray arr) = 
  "[" ++ (foldr (λ elem acc → 
    (if acc == "" then "" else acc ++ ", ") ++ show elem) 
  "" arr) ++ "]"
show (JObject obj) = 
  "{" ++ (foldr (λ pair acc → 
    (if acc == "" then "" else acc ++ ", ") ++ 
    show-str (fst pair) ++ ": " ++ show (snd pair))
  "" obj) ++ "}"
