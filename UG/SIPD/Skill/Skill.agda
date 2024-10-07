module UG.SIPD.Skill.Skill where

open import Base.List.List
open import Base.String.String
open import Base.Pair.Pair
--open import UG.SIPD.Effect.Effect
open import Agda.Primitive 


open import UG.SIPD.State.State
open import Base.Nat.add
open import Base.IO.ALL
open import Base.Unit.Unit

open import Base.Nat.Nat
open import UG.SIPD.State.init
open import Base.Nat.Nat
open import Base.Nat.show

Effect : (R : Set) → Set
Effect R = State → (Pair State R)

data Ret : Set where
  Natural : Ret

as-type : Ret → Set
as-type Natural = Nat

EffectType : Set
EffectType = Σ Ret (λ R → Effect (as-type R))

record Skill : Set (lsuc lzero) where
  constructor MkSkill
  field
    name : String
    effects : List EffectType

increment-click-count : Effect Nat
increment-click-count state = (MkState (State.clickCount state + 1) (State.players state) , State.clickCount state)

test-skill : Skill
test-skill = MkSkill "increment" ((Natural , increment-click-count) :: [])

test-eff-type : EffectType
test-eff-type = (Natural , increment-click-count)

apply-eff : (x : EffectType) → State → Pair State (as-type (Sigma.fst x))
apply-eff (Natural , x) state = do
  let ns = x state
  let val = (Sigma.snd ns)
  let new-s = (Sigma.fst ns)
  new-s , val

apply-skill : Skill → State → Pair State Unit
apply-skill (MkSkill _ []) state        = state , unit
apply-skill (MkSkill n (x :: xs)) state = do
  let new-s , ret = apply-eff x state
  apply-skill (MkSkill n xs) new-s
  
main : IO Unit
main = do
  print "Testing effects lib compilation"
  let (new-state , ret-value) = apply-eff test-eff-type init
  print "new state clicks:" 
  print (show (State.clickCount new-state))
  print "return value:"
  print (show ret-value)


