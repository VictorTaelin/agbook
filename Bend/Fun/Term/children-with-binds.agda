module Bend.Fun.Term.children-with-binds where

open import Bend.Fun.Term.Type
open import Base.List.Type renaming (List to List')
open import Base.List.map
open import Base.List.zip
open import Base.List.append
open import Base.List.concat-maybes
open import Base.Pair.Type
open import Base.String.Type
open import Base.Maybe.Type
open import Bend.Fun.Pattern.binds
import Base.Maybe.to-list as Maybe
import Bend.Fun.MatchRule.Type as MatchRule'
import Bend.Fun.FnDef.Type as FnDef'

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term

-- Returns a list of pairs, each containing a list of bound names and the corresponding child term.
-- - term: The term to get children and bindings from.
-- = A list of pairs, each containing bound names and a child term.
children-with-binds : Term → List' (Pair (List' String) Term)
children-with-binds (Lam pat bod) = (binds pat , bod) :: []
children-with-binds (Var _) = []
children-with-binds (Link _) = []
children-with-binds (Let pat val nxt) = ([] , val) :: (binds pat , nxt) :: []
children-with-binds (With _ bod) = ([] , bod) :: []
children-with-binds (Ask pat val nxt) = ([] , val) :: (binds pat , nxt) :: []
children-with-binds (Use nam val nxt) =  ([] , val) :: (Maybe.to-list nam , nxt) :: []
children-with-binds (App fun arg) = ([] , fun) :: ([] , arg) :: []
children-with-binds (Fan _ els) = map (λ t → ([] , t)) els
children-with-binds (Num _) = []
children-with-binds (Str _) = []
children-with-binds (List els) = map (λ t → ([] , t)) els
children-with-binds (Oper _ fst snd) = ([] , fst) :: ([] , snd) :: []
children-with-binds (Mat bnd arg with-bnd with-arg arms) = 
  (Maybe.to-list bnd , arg) :: 
  map (λ p → (Maybe.to-list (fst p) , snd p)) (zip with-bnd with-arg) ++
  map (λ r → (concat-maybes (MatchRule.bnd r) , MatchRule.bod r)) arms
children-with-binds (Swt bnd arg with-bnd with-arg pred arms) = 
  (Maybe.to-list bnd , arg) :: 
  map (λ p → (Maybe.to-list (fst p) , snd p)) (zip with-bnd with-arg) ++
  map (λ t → (Maybe.to-list pred , t)) arms
children-with-binds (Fold bnd arg with-bnd with-arg arms) = 
  (Maybe.to-list bnd , arg) :: 
  map (λ p → (Maybe.to-list (fst p) , snd p)) (zip with-bnd with-arg) ++
  map (λ r → (concat-maybes (MatchRule.bnd r) , MatchRule.bod r)) arms
children-with-binds (Bend bnd arg cond step base) = 
  map (λ p → (Maybe.to-list (fst p) , snd p)) (zip bnd arg) ++
  ([] , cond) :: ([] , step) :: ([] , base) :: []
children-with-binds (Open _ var bod) = ([] , bod) :: []
children-with-binds (Ref _) = []
children-with-binds (Def _ nxt) = ([] , nxt) :: []
children-with-binds Era = []
 