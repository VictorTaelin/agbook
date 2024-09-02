module HVM.Fun.lookup where

open import Data.Bits.Type
open import Data.Map.get
open import Data.Maybe.Type
open import Data.Pair.Type
open import HVM.Env.Type
open import HVM.Fun.Type
open import HVM.Fun.pure
open import HVM.Term.Type

-- Looks up a variable in the current environment.
-- - var: The variable (as Bits) to look up.
-- = A Fun computation that returns Maybe Term.
lookup : Bits → Fun (Maybe Term)
lookup var env =
  let term = get (Env.sub env) var
  in (env , term)
