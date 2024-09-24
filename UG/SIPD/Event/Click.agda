module UG.SIPD.Event.Click where

data Click : Set where
  LeftButton : Click
  RightButton : Click

{-# FOREIGN GHC data AgdaClick = ALeftButton | ARightButton #-}

{-# COMPILE GHC Click = data AgdaClick (ALeftButton | ARightButton) #-}
