module Data.JSON.Type where

open import Data.Bool.Type
open import Data.Float.Type
open import Data.String.Type
open import Data.List.Type
open import Data.Pair.Type

-- Represents a JSON value.
data JSON : Set where
  JNull   : JSON
  JBool   : Bool → JSON
  JNumber : Float → JSON
  JString : String → JSON
  JArray  : List JSON → JSON
  JObject : List (Pair String JSON) → JSON
