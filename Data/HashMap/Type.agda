module Data.HashMap.Type where

open import Data.Map.Type using (Map)
open import Data.Bits.Type using (Bits)

record HashMap (K : Set) (V : Set) : Set where
  constructor MkHashMap
  field
    map : Map V
    hashf : K → Bits