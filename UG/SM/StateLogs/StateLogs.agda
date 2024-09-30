module UG.SM.StateLogs.StateLogs where

open import UG.SM.Tick.Tick

open import Base.BitMap.BitMap
open import Base.Nat.Nat
open import Base.Maybe.Maybe
open import Base.Equal.Equal

-- Maps from bit indices to States
StateLogs : Set → Set
StateLogs S = BitMap S

-- Represents a node in the state log
record StateNode (S : Set) : Set where
  inductive
  constructor MkStateNode
  field
    tick  : Tick
    keep  : Nat
    life  : Nat
    state : S
    older : Maybe (StateNode S)

StateLog : Set → Set
StateLog S = Maybe (StateNode S)

push : ∀ {S : Set} → S → StateLog S → Tick → StateLog S
push new-state states t with states
... | None = Some (MkStateNode t Zero Zero new-state None)
... | Some node with (StateNode.keep node)
...   | Zero = Some (record node { keep = Succ Zero })
...   | Succ _ with (StateNode.life node)
...     | Zero = Some (MkStateNode t Zero (StateNode.life node) new-state (Some (record node { keep = Zero ; older = (StateNode.older node) })))
...     | Succ life′ = Some (MkStateNode t Zero Zero new-state (Some (record node { keep = Zero ; life = life′ ; older = (StateNode.older node) })))

open import Base.Nat.add
open import Base.Nat.lt
open import Base.Bool.if
open import Base.Bool.Bool
open import Base.Pair.Pair

rollback-helper : ∀ {S : Set} → Nat → Nat → StateLog S → Nat → Pair (StateLog S) Nat
rollback-helper i amount states cut with (lt i amount)
... | False = (states , cut)
... | True with states
...   | None = (None , cut)
...   | Some state = do
  let cut = cut + (StateNode.life state) + 1
  let states = (StateNode.older state)
  rollback-helper (i + 1) amount states cut
  

rollback : ∀ {S : Set} → Nat → StateLog S → StateLog S
rollback amount states with states
... | None = None
... | Some _ with (rollback-helper 0 amount states) 0
...   | (None , _) = None
...   | (Some node , cut) = do
  let tick = StateNode.tick node
  let keep = Zero 
  let life = (StateNode.life node) + cut
  let state = StateNode.state node
  let older = StateNode.older node
  Some (MkStateNode tick keep life state older)

find-rollback-amount-helper : ∀ {S : Set} → Tick → StateLog S → Nat → Nat
find-rollback-amount-helper target-tick None rollback-amount = rollback-amount
find-rollback-amount-helper target-tick (Some node) rollback-amount with (lt target-tick (StateNode.tick node))
... | False = rollback-amount
... | True = find-rollback-amount-helper target-tick (StateNode.older node) (Succ rollback-amount)

find-rollback-amount : ∀ {S : Set} → Tick → StateLog S → Nat
find-rollback-amount target-tick states = find-rollback-amount-helper target-tick states Zero

