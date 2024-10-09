module Bend.Readback.NetToBend.apply-unscoped where

open import Base.Bool.Bool
open import Base.Maybe.Maybe
open import Base.List.List
open import Base.List.contains
open import Base.String.String
open import Base.String.Trait.Eq
open import Bend.Fun.Pattern.Pattern
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.map-children

-- Transforms variables that were found to not have their binding in
-- scope into unscoped variables.
apply-unscoped : Term → List String → Term

apply-unscoped (Var nam) unscoped with (contains nam unscoped)
... | True  = Link nam
... | False = Var nam

apply-unscoped (Lam (Pattern.Var (Some nam)) bod) unscoped with (contains nam unscoped)
... | True  = Lam (Pattern.Chn nam)        (apply-unscoped bod unscoped)
... | False = Lam (Pattern.Var (Some nam)) (apply-unscoped bod unscoped)

apply-unscoped term unscoped = do
  map-children (λ t → apply-unscoped t unscoped) term
