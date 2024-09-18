module Network.WebSocket.WSConnection where

postulate WSConnection : Set

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# COMPILE GHC WSConnection = type WS.Connection #-}
{-# COMPILE JS WSConnection = null #-}
