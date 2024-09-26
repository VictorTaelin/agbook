module Bend.Fun.Term.children where

open import Bend.Fun.Term.Term
open import Base.List.List renaming (List to List')
open import Base.List.append
open import Base.List.concat
open import Base.List.map
open import Base.Maybe.Maybe
import Bend.Fun.MatchRule.MatchRule as MatchRule'
import Bend.Fun.FnDef.FnDef as FnDef'

private
  open module MatchRule = MatchRule' Term
  open module FnDef = FnDef' Term

-- Returns a list of all immediate child terms of a given term.
-- - term: The term to get children from.
-- = A list of all immediate child terms.
children : Term → List' Term
children (Lam _ bod) = bod :: []
children (Var _) = []
children (Link _) = []
children (Let _ val nxt) = val :: nxt :: []
children (With _ bod) = bod :: []
children (Ask _ val nxt) = val :: nxt :: []
children (Use _ val nxt) = val :: nxt :: []
children (App fun arg) = fun :: arg :: []
children (Fan _ els) = els
children (Num _) = []
children (Str _) = []
children (List els) = els
children (Oper _ fst snd) = fst :: snd :: []
children (Mat _ arg _ with-arg arms) = (arg :: []) ++ with-arg ++ (map MatchRule.bod arms)
children (Swt _ arg _ with-arg _ arms) =  (arg :: []) ++ with-arg ++ arms
children (Fold _ arg _ with-arg arms) =  (arg :: []) ++ with-arg ++ (map MatchRule.bod arms)
children (Bend _ arg cond step base) = arg ++ (cond :: step :: base :: [])
children (Open _ _ bod) = bod :: []
children (Ref _) = []
children (Def _ nxt) = nxt :: []
children Era = []
