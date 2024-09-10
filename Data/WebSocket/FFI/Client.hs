{-# LANGUAGE OverloadedStrings #-}

module Data.WebSocket.FFI.Client
  ( WSConnection(..)
  , wsConnect
  , wsSend
  , wsReceive
  , wsClose
  ) where

import qualified Network.WebSockets as WS
import qualified Wuss
import qualified Data.Text as T
import Control.Exception (try, SomeException)
import Data.List.Split (splitOn)

newtype WSConnection = WSConnection WS.Connection

wsConnect :: Bool -> T.Text -> Int -> T.Text -> IO (Maybe WSConnection)
wsConnect secure host port path = do
  result <- try $ if secure
                  then Wuss.runSecureClient (T.unpack host) (fromIntegral port) (T.unpack path) clientApp
                  else WS.runClient (T.unpack host) port (T.unpack path) clientApp
  case result of
    Left (_ :: SomeException) -> return Nothing
    Right conn -> return $ Just conn

clientApp :: WS.ClientApp WSConnection
clientApp conn = return $ WSConnection conn

wsSend :: WSConnection -> T.Text -> IO Bool
wsSend (WSConnection conn) msg = do
  result <- try $ WS.sendTextData conn msg
  case result of
    Left (_ :: SomeException) -> return False
    Right _ -> return True

wsReceive :: WSConnection -> IO (Maybe T.Text)
wsReceive (WSConnection conn) = do
  result <- try $ WS.receiveData conn
  case result of
    Left (_ :: SomeException) -> return Nothing
    Right msg -> return $ Just msg

wsClose :: WSConnection -> IO Bool
wsClose (WSConnection conn) = do
  result <- try $ WS.sendClose conn ("Bye!" :: T.Text)
  case result of
    Left (_ :: SomeException) -> return False
    Right _ -> return True

