module Network.WebSocket.run-client where

open import Network.WebSocket.WSConnection
open import Data.String.Type
open import Data.IOAsync.Type
open import Data.Unit.Type
open import Data.Int.Type

postulate
  run-client : String → Int → String → (WSConnection → IOAsync Unit) → IOAsync Unit

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC run-client = \host port path app -> WS.runClient (T.unpack host) (fromIntegral port) (T.unpack path) (\conn -> app conn) #-}

