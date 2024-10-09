module Bend.Fun.Term.children-with-binds where

open import Bend.Fun.Term.Term
open import Base.List.List renaming (List to List')
open import Base.List.map
open import Base.List.append
open import Base.List.concat-maybes
open import Base.List.reverse
open import Base.List.split-at
open import Base.Pair.Pair
open import Base.String.String
open import Base.Maybe.Maybe
open import Bend.Fun.Pattern.binds
import Base.Maybe.to-list as Maybe
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term

-- Returns a list of pairs, each containing a list of bound names and the corresponding child term.
-- - term: The term to get children and bindings from.
-- = A list of pairs, each containing bound names and a child term.
children-with-binds : Term → List' (Pair (List' String) Term)
children-with-binds (Var _)  = []
children-with-binds (Link _) = []
children-with-binds (Num _)  = []
children-with-binds (Str _)  = []
children-with-binds (Ref _)  = []
children-with-binds Era      = []
children-with-binds (Open _ _ bod)    = ([] , bod) :: []
children-with-binds (Def _ nxt)       = ([] , nxt) :: []
children-with-binds (With _ bod)      = ([] , bod) :: []
children-with-binds (App fun arg)     = ([] , fun) :: ([] , arg) :: []
children-with-binds (Oper _ fst snd)  = ([] , fst) :: ([] , snd) :: []
children-with-binds (Fan _ els)       = map (λ t → ([] , t)) els
children-with-binds (List els)        = map (λ t → ([] , t)) els
children-with-binds (Lam pat bod)     = (binds pat , bod) :: []
children-with-binds (Let pat val nxt) = ([] , val) :: (binds pat , nxt) :: []
children-with-binds (Ask pat val nxt) = ([] , val) :: (binds pat , nxt) :: []
children-with-binds (Use nam val nxt) = ([] , val) :: (Maybe.to-list nam , nxt) :: []

children-with-binds (Mat bnd arg with-bnd with-arg arms) = do
  (([] , arg) :: []) ++
    (map (λ arg → ([] , arg)) with-arg) ++
    (map (λ rule → concat-maybes (bnd :: [] ++ with-bnd ++ MatchRule.bnd rule) , MatchRule.bod rule) arms)

children-with-binds (Swt bnd arg with-bnd with-arg pred arms) = do
  let pred' , nums = split-at 1 (reverse arms)
  let nums = reverse nums
  (([] , arg) :: []) ++
    (map (λ arg → ([] , arg)) with-arg) ++
    (map (λ arm → concat-maybes (bnd :: [] ++ with-bnd) , arm) nums) ++
    (map (λ arm → concat-maybes (bnd :: [] ++ with-bnd ++ pred :: []) , arm) pred')

children-with-binds (Fold bnd arg with-bnd with-arg arms) = do
  (([] , arg) :: []) ++
    (map (λ arg → ([] , arg)) with-arg) ++
    (map (λ rule → concat-maybes (bnd :: [] ++ with-bnd ++ MatchRule.bnd rule) , MatchRule.bod rule) arms)

children-with-binds (Bend bnd arg cond step base) = do
  (map (λ arg → ([] , arg)) arg) ++
    ((concat-maybes bnd) , cond) ::
    ((concat-maybes bnd) , step) ::
    ((concat-maybes bnd) , base) :: []

