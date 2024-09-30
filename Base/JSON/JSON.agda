module Base.JSON.JSON where

open import Base.Bool.Bool
open import Base.F64.F64
open import Base.String.String
open import Base.List.List
open import Base.Pair.Pair

-- Represents a JSON value.
data JSON : Set where
  JNull   : JSON
  JBool   : Bool → JSON
  JNumber : F64 → JSON
  JString : String → JSON
  JArray  : List JSON → JSON
  JObject : List (Pair String JSON) → JSON
