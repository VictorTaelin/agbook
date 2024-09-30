module Network.WebSocket.send-text-data where

open import Base.IO.IO
open import Base.String.String
open import Base.Unit.Unit
open import Network.WebSocket.WSConnection

-- Sends text data over a WebSocket connection.
-- - conn: The WebSocket connection to send data through.
-- - msg: The text message to be sent.
-- = An asynchronous operation that sends the text data and returns nothing.
postulate send-text-data : WSConnection → String → IO Unit

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}

{-# COMPILE GHC send-text-data = \conn msg → WS.sendTextData conn msg #-}
