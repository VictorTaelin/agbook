{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.WebSocket.FFI.Client
import qualified Data.Text as T
import Control.Concurrent (forkIO)
import Control.Monad (forever, unless, void)
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  let (secure, host, port, path) = parseArgs args
  putStrLn $ "Connecting to " ++ (if secure then "wss://" else "ws://") ++ T.unpack host ++ ":" ++ show port ++ T.unpack path
  maybeConn <- wsConnect secure host port path
  case maybeConn of
    Nothing -> putStrLn "Failed to connect to the WebSocket server."
    Just conn -> do
      putStrLn "Connected successfully!"

      -- Fork a thread to continuously receive messages
      void . forkIO . forever $ do
        maybeMsg <- wsReceive conn
        case maybeMsg of
          Nothing -> putStrLn "Error receiving message"
          Just msg -> putStrLn $ "Received: " ++ T.unpack msg

      -- Main loop for sending messages
      let loop = do
            line <- getLine
            unless (null line) $ do
              sendResult <- wsSend conn (T.pack line)
              if sendResult
                then putStrLn "Message sent successfully"
                else putStrLn "Failed to send message"
              loop

      loop

      -- Close the connection
      wsClose conn
      putStrLn "Connection closed"

parseArgs :: [String] -> (Bool, T.Text, Int, T.Text)
parseArgs args = case args of
  ["--secure", host, port, path] -> (True, T.pack host, read port, T.pack path)
  [host, port, path]             -> (False, T.pack host, read port, T.pack path)
  _                              -> (False, "localhost", 8080, "/")  -- Default values
