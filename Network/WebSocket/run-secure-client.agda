module Network.WebSocket.run-secure-client where

open import Network.WebSocket.WSConnection
open import Data.String.Type
open import Data.IOAsync.Type
open import Data.Unit.Type
open import Data.Int.Type

postulate
  run-secure-client : String → Int → String → (WSConnection → IOAsync Unit) → IOAsync Unit

{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# FOREIGN GHC import qualified Wuss #-}

{-# COMPILE GHC run-secure-client = \host port path app -> Wuss.runSecureClient (T.unpack host) (fromIntegral port) (T.unpack path) (\conn -> app conn) #-}


