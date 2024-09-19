module Base.JSON.show where

open import Base.JSON.Type
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Float.Type
open import Base.String.Type
open import Base.String.show renaming (show to show-str)
open import Base.String.append
open import Base.String.eq
open import Base.List.Type
open import Base.List.foldr
open import Base.Pair.Type
open import Base.Pair.get-fst
open import Base.Pair.get-snd

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
