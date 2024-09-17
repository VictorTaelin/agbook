module UG.SM.Game.Type where

record Game (S A : Set) : Set where
  field
    init : S
    when : A → S → S
    tick : S → S

{-# FOREIGN GHC
data Game s a = MkGame
  { init :: s
  , when :: a -> s -> s
  , tick :: s -> s
  }
#-}

{-# COMPILE GHC Game = data Game (MkGame) #-}
