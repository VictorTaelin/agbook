module Data.HashMap.set where

open import Data.HashMap.Type
open import Data.Bits.Type
open import Data.Map.set renaming (set to set-map)

-- Sets a value in the HashMap at a specific key.
set : ∀ {K V : Set} → HashMap K V → K → V → HashMap K V
set (MkHashMap m hashf) k v = MkHashMap (set-map m (hashf k) v) hashf