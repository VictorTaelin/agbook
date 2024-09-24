module Base.JSON.Type where

open import Base.Bool.Type
open import Base.Float.Type
open import Base.String.Type
open import Base.List.Type
open import Base.Pair.Type

-- Represents a JSON value.
data JSON : Set where
  JNull   : JSON
  JBool   : Bool -> JSON
  JNumber : Float -> JSON
  JString : String -> JSON
  JArray  : List JSON -> JSON
  JObject : List (Pair String JSON) -> JSON
