module Network.WebSocket.Client where

open import Data.IO.Type
open import Data.Maybe.Type
open import Data.String.Type
open import Data.Bool.Type
open import Data.Pair.Type
open import Data.Unit.Type
open import Data.Int.Type

postulate WSConnection : Set

postulate
  runClient : String → Int → String → (WSConnection → IO Unit) → IO Unit
  runSecureClient : String → Int → String → (WSConnection → IO Unit) → IO Unit
  receiveData : WSConnection → IO String
  sendTextData : WSConnection → String → IO Unit
  sendClose : WSConnection → String → IO Unit

{-# FOREIGN GHC import qualified Network.WebSockets as WS #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# FOREIGN GHC import qualified Wuss #-}
{-# FOREIGN GHC import qualified Control.Concurrent as CC #-}
{-# FOREIGN GHC import qualified Network.Socket as NS #-}
{-# COMPILE GHC WSConnection = type WS.Connection #-}
{-# COMPILE GHC runClient = \host port path app -> WS.runClient (T.unpack host) (fromIntegral port) (T.unpack path) (\conn -> app conn) #-}
{-# COMPILE GHC runSecureClient = \host port path app -> Wuss.runSecureClient (T.unpack host) (fromIntegral port) (T.unpack path) (\conn -> app conn) #-}
{-# COMPILE GHC receiveData = \conn -> (WS.receiveData conn) #-}
{-# COMPILE GHC sendTextData = \conn msg -> WS.sendTextData conn msg #-}
{-# COMPILE GHC sendClose = \conn msg -> WS.sendClose conn msg #-}

{-# FOREIGN JS import * as WebSocket from "ws" #-}
{-# FOREIGN JS import * as https from "https" #-}

{-# COMPILE JS WSConnection = null #-}

{-# COMPILE JS runClient = function(host) { return function(port) { return function(path) { return function(app) { return function() {
  return new Promise((resolve, reject) => {
    const ws = new WebSocket.WebSocket(`ws://${host}:${port}${path}`);
    ws.on('open', function open() {
      app(ws)().then(resolve).catch(reject);
    });
    ws.on('error', reject);
  });
}; }; }; }; } #-}

{-# COMPILE JS runSecureClient = function(host) { return function(port) { return function(path) { return function(app) { return function() {
  return new Promise((resolve, reject) => {
    const ws = new WebSocket.WebSocket(`wss://${host}:${port}${path}`, {
      agent: new https.Agent({
        rejectUnauthorized: false
      })
    });
    ws.on('open', function open() {
      app(ws)().then(resolve).catch(reject);
    });
    ws.on('error', reject);
  });
}; }; }; }; } #-}

{-# COMPILE JS receiveData = function(conn) { return function() {
  return new Promise((resolve, reject) => {
    conn.once('message', (data) => {
      resolve(data.toString());
    });
    conn.once('error', reject);
  });
}; } #-}

{-# COMPILE JS sendTextData = function(conn) { return function(msg) { return function() {
  return new Promise((resolve, reject) => {
    conn.send(msg, (err) => {
      if (err) reject(err);
      else resolve();
    });
  });
}; }; } #-}

{-# COMPILE JS sendClose = function(conn) { return function(msg) { return function() {
  return new Promise((resolve) => {
    conn.close(1000, msg);
    conn.once('close', resolve);
  });
}; }; } #-}
