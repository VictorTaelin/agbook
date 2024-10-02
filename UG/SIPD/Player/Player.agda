module UG.SIPD.Player.Player where

open import Base.Nat.Nat
open import Base.String.String
open import Base.OrdMap.OrdMap
open import Base.Bool.Bool

record Player : Set where
  constructor MkPlayer
  field
    id : Nat
    name : String
    key : OrdMap String Bool

{-# FOREIGN GHC
import qualified Data.Map as Map

data Player = MkPlayer
  { id :: Integer
  , name :: String
  , key :: Map.Map String Bool
  }
#-}

{-# COMPILE GHC Player = data Player (MkPlayer) #-}

