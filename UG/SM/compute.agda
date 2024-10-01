module UG.SM.compute where

import Base.Bool.show as Bool
import Base.Nat.show as Nat
open import Base.BitMap.get
open import Base.BitMap.set
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.IO.ALL
open import Base.IO.ALL
open import Base.List.List
open import Base.List.foldr
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Nat.gt
open import Base.Nat.lt
open import Base.Nat.max
open import Base.Nat.sub
open import Base.Nat.to-bits
open import Base.Pair.Pair
open import Base.String.append
open import UG.SM.ActionLogs.ActionLogs
open import UG.SM.ActionLogs.get-actions
open import UG.SM.Game.Game
open import UG.SM.SM
open import UG.SM.StateLogs.StateLogs
open import UG.SM.Tick.Tick
open import UG.SM.Time.Time
open import UG.SM.Time.time-to-tick
open import UG.SM.get-initial-state
open import UG.SM.update-mach

open import Base.List.length
open import Base.Nat.show
open import Base.String.append

-- mach: The state machine.
-- game: The game rules.
-- state: The current state.
-- current-tick: The current tick.
-- end-tick: The target tick.
-- = The computed state at the end tick.
compute-helper : ∀ {S A : Set} → Mach S A → Game S A → S → Tick → Tick → IO (Pair S (Mach S A))
compute-helper mach game state current-tick end-tick with current-tick == end-tick
... | True = do
  pure (state , mach)
... | False = do
  let next-tick = Succ current-tick
  let actions = get-actions (Mach.action-logs mach) current-tick
  let state-with-actions = foldr (Game.when game) state actions
  let next-state = Game.tick game state-with-actions
  let updated-mach = update-mach mach current-tick state
  compute-helper updated-mach game next-state next-tick end-tick
 
-- Computes the state of the game at a given time.
-- mach: The state machine.
-- game: The game rules.
-- time: The target time.
-- = The computed state at the given time.
compute : ∀ {S A : Set} → Mach S A → Game S A → Time → IO (Pair S (Mach S A))
compute mach game time = do
  let end-t = time-to-tick mach time
  let (state , start-tick) = get-initial-state mach game
  let diff = end-t - start-tick
  if diff > 1000000
    then pure (state , mach)
    else compute-helper mach game state start-tick end-t
