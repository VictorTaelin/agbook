module UG.SM.Game.Game where

-- Represents a game with state type S and action type A
-- Fields:
--   init : The initial state of the game
--   when : A function that updates the state based on an action
--   tick : A function that updates the state on each tick (time step)
record Game (S A : Set) : Set where
  field
    init : S
    when : A → S → S
    tick : S → S

{-# FOREIGN GHC
data Game s a = MkGame
  { init :: s
  , when :: a → s → s
  , tick :: s → s
  }
#-}

{-# COMPILE GHC Game = data Game (MkGame) #-}
