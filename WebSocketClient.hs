import Wuss

import Control.Concurrent (forkIO)
import Control.Monad (forever, unless, void)
import Data.Text (Text, pack)
import Network.WebSockets (ClientApp, receiveData, sendClose, sendTextData)

main :: IO ()
main = runSecureClient "echo.websocket.org" 443 "/" ws

ws :: ClientApp ()
ws connection = do
    putStrLn "Connected!"

    void . forkIO . forever $ do
        message <- receiveData connection
        print (message :: Text)

    let loop = do
            line <- getLine
            unless (null line) $ do
                sendTextData connection (pack line)
                loop
    loop

    sendClose connection (pack "Bye!")
