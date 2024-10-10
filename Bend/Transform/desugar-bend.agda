module Bend.Transform.desugar-bend where

open import Base.Function.case
open import Base.List.List
open import Base.List.mmap
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Trait.Monad
open import Base.String.String
open import Base.String.append
open import Base.Trait.Monad
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.mmap-rules
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.map-children
open import Bend.Fun.Term.free-vars
open import Bend.Transform.subst
import Bend.Fun.FnDef.FnDef as FnDef'
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.Rule.Rule as Rule'

private
  open module FnDef = FnDef' Term
  open module MatchRule = MatchRule' Term
  open module Rule = Rule' Term

-- Desugars 'bend' expressions in a Book
-- - book: The Book to desugar
-- = Either the desugared Book or an error message
desugar-bend : Book → Result Book String
desugar-bend book = do
  let keys , defs = unzip (to-list (Book.defs book))
  res ← mmap desugar-def defs
  let (defs , new-defs) = unzip res
  let book = record book { defs = from-list (zip keys old-defs) }
  let book = foldr add-fn-def book (concat new-defs)
  Done book

  where
  RECURSIVE_KW : String
  RECURSIVE_KW = "fork"

  NEW_FN_SEP : String
  NEW_FN_SEP = "__bend"

  desugar-term : FnDef → Nat → Term → Result (Pair Term (Pair (List FnDef) Nat)) String
  desugar-term def fresh term = do
    -- TODO: mmap-children-with? This looks horrible,
    --       we just need to extract the defs recursively, depth-first.
    let desugar-child = (λ res child → (do
      case res  of λ where
        (Done (defs , fresh)) → case (desugar-term def fresh child) of λ where
          (Done (child , new-defs , fresh)) → (Done (new-defs ++ defs , fresh) , child)
          (Fail err)                        → (Fail err , child)
        (Fail err) → (Fail err , child)))
    let (res , term) = map-children-with desugar-child (Done ([] , fresh) , term)
    (new-defs , fresh) ← res

    case term of λ where
      (Bend bnd arg cond step base) → do
        if (has-unscoped-diff term)
          then Fail "Can't have non self-contained unscoped variables in a 'bend'"
          else Done unit

        let new-name = (FnDef.name def) ++ NEW_FN_SEP ++ (show fresh)

        -- Gather the free variables
        -- They will be implicitly captured by the new function
        let fvs = free-vars step
        let fvs = filter (λ x → neq RECURSIVE_KW X) fvs
        let fvs = List.append (free-vars base) fvs
        let fvs = List.append (free-vars cond) fvs
        let fvs = filter (λ x → not (contains x bnd)) fvs

        -- Add a substitution of `fork`, a use term with a partially applied recursive call
        let step = Use (Some RECURSIVE_KW)
                      (foldl-app (Ref new-name) (map Var fvs) arg)
                      step

        -- Create the new function
        let body = Swt (Some "_") cond [] [] (Some "_-1") (base :: step :: [])
        let body = foldr-lam body bnd
        let body = foldr-lam body (map Some fvs)
        let def = new-gen new-name
                          ((MkRule [] body) :: [])
                          (FnDef.src def)
                          (FnDef.check def)

        -- Call the new function
        let term = foldl-app (Ref new-name) (map Var free-vars)
        let term = foldl-app term arg
        Done (term , new-defs , fresh)
      _ → do
        Done (term , new-defs , fresh)

  desugar-rule : FnDef → Rule → Nat → Result (Pair Rule (Pair (List FnDef) Nat)) String
  desugar-rule def rule fresh = do
    (body , new-defs , fresh) ← desugar-term (Rule.name rule) 0 (Rule.body rule)
    pure (record rule { body = body } , new-defs , fresh)

  desugar-def : FnDef → Result (Pair FnDef (List FnDef)) String
  desugar-def def = do
    mfoldl desugar-rule
