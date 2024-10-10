module Imp.Eval.Env.show where

open import Base.List.List
open import Base.Maybe.Maybe
open import Base.OrdMap.get renaming (get to ordmap-get)
open import Base.String.Trait.Ord
open import Base.String.String
open import Base.String.append
open import Base.List.map as List
open import Base.OrdMap.to-list as OrdMap
import Base.String.join as String
import Base.U64.show as U64
open import Base.U64.U64
open import Imp.Eval.Env.Env
open import Base.Pair.Pair

-- Get a variable's value in the top-most map.
show : Env → String
show []          = "{}"
show (m :: rest) = "{" ++ (String.join ", " (List.map (λ { (k , v) → (k ++ " -> " ++ (U64.show v)) }) (OrdMap.to-list m))) ++ "}" ++ " :: " ++ (show rest)
