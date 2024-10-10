module Bend.Readback.NetToBend.net-to-bend where

open import Base.BitMap.empty
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Bool.or
open import Base.Function.case
open import Base.List.List
open import Base.List.sum
open import Base.List.map
open import Base.Maybe.Maybe
open import Base.Maybe.eq as Maybe
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.gte
open import Base.Nat.sub
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.String.String
open import Base.String.Trait.Eq
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.recursive-defs
open import Bend.Fun.FanKind.FanKind
open import Bend.Fun.Term.Term
open import Bend.Fun.Term.children
open import Bend.Fun.Term.map-children-with
open import Bend.Net.Net
open import Bend.Net.Node.Node
open import Bend.Net.NodeKind.to-fan-kind
open import Bend.Net.Port.Port
open import Bend.Net.get-port
open import Bend.Net.get-node
open import Bend.Net.net-root
open import Bend.Readback.NetToBend.Reader
open import Bend.Readback.NetToBend.apply-unscoped
open import Bend.Readback.NetToBend.gen-bnd
open import Bend.Readback.NetToBend.collect-unscoped
open import Bend.Readback.NetToBend.read-term
import Bend.Fun.Pattern.Pattern as Pat

-- Converts an intermediate HVM net back to a Bend Term.
-- - net: The intermediate HVM net to convert.
-- - book: The Bend program before compiling to HVM (to expand generated fns).
-- - linear: Whether to perform linear readback.
-- = A Result   containing the Bend Term or an error message.
net-to-bend : Net → Book → Bool → Result Term String
net-to-bend net book linear = do
  let reader = MkReader net book empty 0 linear [] [] empty empty
  root <- get-port net net-root
  (reader , term) ← read-term reader root
  (reader , term) ← process-fans reader term
  let unscoped = collect-unscoped term []
  let term = apply-unscoped term unscoped
  Done term

  where

  -- Counts how many times the variables of a fan are used in a term.
  count-fan-uses : Maybe String → Maybe String → Term → Nat
  count-fan-uses fst snd (Var nam) = do
    if (Maybe.eq (Some nam) fst) || (Maybe.eq (Some nam) snd) then 1 else 0
  count-fan-uses fst snd term = do
    sum (map (count-fan-uses fst snd) (children term))

  -- Adds a let fan term at the lowest common ancestor of the uses of a fan's binds.
  -- - uses: The number of times the fan's binds are used in the term (must count before).
  -- - fan: The fan kind.
  -- - fst: The name of the first fan bind.
  -- - snd: The name of the second fan bind.
  -- - val: The value to be inserted in the let fan term.
  -- - term: The term to insert the let fan term into.
  -- = Returns a pair of:
  --   * How many times a variable has been used in the term or None if the Let was already inserted in one of the children.
  --   * The updated term.
  --   Expected to always return None when first called (because we already counted how many times the variable occurs).
  insert-fan-split : Nat → FanKind → Maybe String → Maybe String → Term → Term → Pair (Maybe Nat) Term
  insert-fan-split uses fan fst snd val term = do
    let n , term =
          map-children-with (λ where None     t → None , t
                                     (Some n) t → insert-fan-split (uses - n) fan fst snd val t)
                            (Some 0) term
    case n of λ where
      -- Already inserted the dup in one of the children
      None → do
        None , term
      (Some n) → do
        let n2 = case term of λ where
          (Var nam) → if (Maybe.eq (Some nam) fst) || (Maybe.eq (Some nam) snd) then 1 else 0
          _         → 0
        if ((n + n2) >= uses)
          then (do
            (None , Let (Pat.Fan fan (Pat.Var fst :: Pat.Var snd :: [])) val term))
          else do
            (Some (n + n2) , term)


  process-fans : Reader → Term → Result (Pair Reader Term) String
  process-fans r@(MkReader _ _ _ _ _ _ (node :: fans) _ _) term = do
    let r        = record r { fans = fans }
    r , val      ← read-term r (MkPort node 0)
    r , fst      ← gen-bnd   r (MkPort node 1)
    r , snd      ← gen-bnd   r (MkPort node 2)
    node         ← get-node (Reader.net r) node
    fan          ← to-fan-kind (Node.kind node)
    let uses     = count-fan-uses fst snd term
    let _ , term = insert-fan-split uses fan fst snd val term
    process-fans r term
  process-fans r@(MkReader _ _ _ _ _ _ [] _ _) term = do
    Done (r , term)

