module Bend.Fun.Term.is-ref where

open import Base.Bool.Bool
open import Bend.Fun.Term.Term

is-ref : Term -> Bool
is-ref (Ref _) = True
is-ref _       = False
