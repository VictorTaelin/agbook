module HVM.Fun.subst where

open import Data.Bits.Type
open import Data.Map.set
open import Data.Pair.Type
open import Data.Unit.Type
open import HVM.Env.Type
open import HVM.Fun.Type
open import HVM.Term.Type

-- Sets a variable/term pair in the substitution map of the Env.
-- - var: The variable (as Bits) to be substituted.
-- - term: The Term to substitute for the variable.
-- = A Fun computation that updates the Env with the new substitution.
subst : Bits → Term → Fun Unit
subst var term env =
  let new_sub = set (Env.sub env) var term
      new_env = record env { sub = new_sub }
  in (new_env , unit)
