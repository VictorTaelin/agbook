import qualified Data.ByteString.Lazy as LBS
import qualified Data.ByteString as BS
import qualified Network.WebSockets as WS
import Control.Monad (forever)
import Data.Word (Word8)

handleMessage :: WS.Connection -> WS.DataMessage -> IO ()
handleMessage conn (WS.Binary msg) = do
    -- Process the received binary data (msg is a ByteString)
    let messageType = LBS.head msg  -- The first byte for message type
        dataPart = LBS.tail msg      -- The remaining bytes as the data part

    -- Print or process the message type and data
    putStrLn $ "Received message type: " ++ show messageType
    putStrLn $ "Received data: " ++ show dataPart

    -- You can handle different message types here
    case messageType of
        1 -> putStrLn "Handling PING message"
        _ -> putStrLn "Unknown message type"

handleMessage _ _ = return () -- Handle other message types if needed

-- Main loop to handle incoming messages
webSocketServer :: WS.ServerApp
webSocketServer pending = do
    conn <- WS.acceptRequest pending
    forever $ do
        msg <- WS.receiveDataMessage conn
        handleMessage conn msg

main :: IO ()
main = WS.runServer "127.0.0.1" 8080 webSocketServer
