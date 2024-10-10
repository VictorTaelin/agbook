module Base.Network.WebSocket.WSConnection where

-- Represents a WebSocket connection.
-- This type is used for interacting with WebSocket connections in Agda.
postulate WSConnection : Set

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# COMPILE GHC WSConnection = type WS.Connection #-}
{-# COMPILE JS WSConnection = null #-}

