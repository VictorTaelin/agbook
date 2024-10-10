module Bend.Fun.Term.mmap-children where

open import Base.Function.id
open import Base.List.List
open import Base.List.concat-maybes
open import Base.List.mmap
open import Base.List.unsnoc
open import Base.Maybe.fold as Maybe
open import Base.Pair.Pair
open import Base.String.String
open import Base.Trait.Monad
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Pattern.binds
import Bend.Fun.MatchRule.MatchRule as MatchRule'

private
  open module MatchRule = MatchRule' Term

mmap-children : ∀ {M : Set -> Set} {{_ : Monad M}} → (List String → Term → M Term) → Term → M Term
mmap-children f (Var x)     = f [] (Var x)
mmap-children f (Link x)    = f [] (Link x)
mmap-children f (Lam pat t) = f (binds pat) t
mmap-children f (Num n)     = f [] (Num n)
mmap-children f (Str s)     = f [] (Str s)
mmap-children f (Ref nam)   = f [] (Ref nam)
mmap-children f Era         = f [] Era
mmap-children f (App fun arg) = do
  fun ← f [] fun
  arg ← f [] arg
  pure (App fun arg)

mmap-children f (Let pat val nxt) = do
  val ← f [] val
  nxt ← f (binds pat) nxt
  pure (Let pat val nxt)

mmap-children f (With typ bod) = do
  bod ← f [] bod
  pure (With typ bod)

mmap-children f (Ask pat val nxt) = do
  val ← f [] val
  nxt ← f (binds pat) nxt
  pure (Ask pat val nxt)

mmap-children f (Use nam val nxt) = do
  val ← f [] val
  nxt ← f (concat-maybes (nam :: [])) nxt
  pure (Use nam val nxt)

mmap-children f (Fan kind els) = do
  els ← mmap (f []) els
  pure (Fan kind els)

mmap-children f (List' els) = do
  els ← mmap (f []) els
  pure (List' els)

mmap-children f (Oper op fst snd) = do
  fst ← f [] fst
  snd ← f [] snd
  pure (Oper op fst snd)

mmap-children f (Open typ var bod) = do
  bod ← f [] bod
  pure (Open typ var bod)

-- Note: we don't recurse on the 'def'
mmap-children f (Def def nxt) = do
  nxt ← f [] nxt
  pure (Def def nxt)

mmap-children f (Mat bnd arg with-bnd with-arg arms) = do
  arg ← f [] arg
  with-arg ← mmap (f []) with-arg
  arms ← mmap (λ (MkMatchRule ctr fld bod) → do
                bod ← f (concat-maybes (bnd :: fld)) bod
                pure (MkMatchRule ctr fld bod))
              arms
  pure (Mat bnd arg with-bnd with-arg arms)

mmap-children f (Fold bnd arg with-bnd with-arg arms) = do
  arg ← f [] arg
  with-arg ← mmap (f []) with-arg
  arms ← mmap (λ (MkMatchRule ctr fld bod) → do
                bod ← f (concat-maybes (bnd :: fld)) bod
                pure (MkMatchRule ctr fld bod))
              arms
  pure (Fold bnd arg with-bnd with-arg arms)

mmap-children f (Swt bnd arg with-bnd with-arg pred arms) = do
  arg ← f [] arg
  with-arg ← mmap (f []) with-arg
  let (nums , succ) = unsnoc arms
  let succ = Maybe.fold Era id succ
  nums ← mmap (f (concat-maybes (bnd :: []))) nums
  succ ← f (concat-maybes (bnd :: pred :: [])) succ
  pure (Swt bnd arg with-bnd with-arg pred arms)

mmap-children f (Bend bnd arg cond step base) = do
  arg ← mmap (f []) arg
  cond ← f (concat-maybes bnd) cond
  step ← f (concat-maybes bnd) step
  base ← f (concat-maybes bnd) base
  pure (Bend bnd arg cond step base)
