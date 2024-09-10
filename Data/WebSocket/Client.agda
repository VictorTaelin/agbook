module Data.WebSocket.Client where

open import Data.IO.Type
open import Data.Maybe.Type
open import Data.String.Type
open import Data.Bool.Type
open import Data.Pair.Type

-- Opaque type to represent the WSConnection
postulate WSConnection : Set

-- FFI declarations
{-# FOREIGN GHC
import qualified Network.WebSockets as WS
import qualified Data.Text as T
import Control.Concurrent.MVar (MVar)
import Data.WebSocket.FFI.Client (WSConnection(..), wsConnect, wsSend, wsReceive, wsClose)
#-}

{-# COMPILE GHC WSConnection = type WSConnection #-}

-- Function to connect to a WebSocket server
postulate ws_connect : String → IO (Maybe WSConnection)
{-# COMPILE GHC ws_connect = wsConnect #-}

-- Function to send a message through the WebSocket connection
postulate ws_send : WSConnection → String → IO Bool
{-# COMPILE GHC ws_send = wsSend #-}

-- Function to receive a message from the WebSocket connection
postulate ws_receive : WSConnection → IO (Maybe String)
{-# COMPILE GHC ws_receive =  wsReceive #-}

-- Function to close the WebSocket connection
postulate ws_close : WSConnection → IO Bool
{-# COMPILE GHC ws_close = wsClose #-}
