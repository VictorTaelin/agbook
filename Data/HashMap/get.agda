
module Data.HashMap.get where

open import Data.HashMap.Type
open import Data.Bits.Type
open import Data.Map.get renaming (get to get-map)
open import Data.Maybe.Type

-- Retrieves a value from the HashMap given a key.
get : ∀ {K V : Set} → HashMap K V → K → Maybe V
get (MkHashMap m hashf) k = get-map m (hashf k)